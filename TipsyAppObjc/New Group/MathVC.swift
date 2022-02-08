//
//  MathVC.swift
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/4/22.
//

import UIKit
@objc(MathVC)
class MathVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        actualMath()
        propertyDeclarations()
        // Do any additional setup after loading the view.
    }
}
extension MathVC{
    func actualMath(){
        let object = Math()
        debugPrint(object.add(numOne: 5, numTwo: 5))
        debugPrint(object.subtract(numOne: 10, numTwo: 5))
        debugPrint(object.divide(numOne: 25, numTwo: 5))
        debugPrint(object.multiply(numOne: 20, numTwo: 5))
    }
    
    func propertyDeclarations(){
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height;
    
        let back = UIButton()
        back.frame = CGRect(x: 40, y: height - 80, width: width - 80, height: 50)
        back.backgroundColor = UIColor.black
        back.isUserInteractionEnabled = true
        back.setTitle("Go Back", for: .normal)
        back.setTitleColor(UIColor.white, for: .normal)
        back.layer.cornerRadius = 8
        back.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        view.addSubview(back)
        
        let objc = UIButton()
        objc.frame = CGRect(x: 40, y: back.frame.minY - 80, width: width - 80, height: 50)
        objc.backgroundColor = UIColor.black
        objc.isUserInteractionEnabled = true
        objc.setTitle("Go to Objc", for: .normal)
        objc.setTitleColor(UIColor.white, for: .normal)
        objc.layer.cornerRadius = 8
        objc.addTarget(self, action: #selector(objcPressed), for: .touchUpInside)
        view.addSubview(objc)
    
    }
    @objc func objcPressed(){
        debugPrint("Goin to Objc VC again")
        let vc = ObjcVC()
        vc.rocketLaunch()
        self.present(vc, animated: true, completion: nil)
        
    }
    @objc func backPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}
