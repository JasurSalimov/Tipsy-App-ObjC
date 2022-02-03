//
//  Tipsy.h
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tipsy : UIViewController<UITextFieldDelegate>
@property (strong,nonatomic) UITextField *receipt;
@property (nonatomic) int tipId;
@property UIButton *five, *ten, *fifteen, *twenty;
@end

NS_ASSUME_NONNULL_END
