//
//  WaterCell.swift
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/8/22.
//

import UIKit
import WaveAnimationView
class WaterCell: UICollectionViewCell {
    var wave: WaveAnimationView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let width:CGFloat = UIScreen.main.bounds.size.width
        wave = WaveAnimationView(frame: CGRect(x: 0, y: 70, width: width, height: 150), frontColor: UIColor.blue, backColor: UIColor.gray)
        wave.frontColor = hexStringToUIColor(hex: "0080FF").withAlphaComponent(0.3)
        wave.backColor = hexStringToUIColor(hex: "0080FF")
        contentView.addSubview(wave)
        wave.startAnimation()
        self.wave.progress = 1.0
        
//        open var waveHeight: CGFloat = 15.0 //3.0 .. about 50.0 are standard.
//        open var waveDelay: CGFloat = 300.0 //0.0 .. about 500.0 are standard.
    }

    deinit{
        wave.stopAnimation()
        debugPrint("deinit");
    }

}
//MARK: - Hex String to UIColor method
extension WaterCell {
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
