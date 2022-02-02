//
//  Bmi.h
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bmi : UIViewController<UITextFieldDelegate>{
    float bmiValue;
}
@property (nonatomic) float bmiValue;
@property (strong, nonatomic) UITextField *weightTF;
@property (strong, nonatomic) UITextField *heightTF;

@end

NS_ASSUME_NONNULL_END
