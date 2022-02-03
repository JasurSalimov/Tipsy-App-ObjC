//
//  Tipsy.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/2/22.
//
// The app takes the total receipt quantity and then you select the 5,10,15,20 % range for tip it will calculate total price
#import "Tipsy.h"

@interface Tipsy ()
@end

@implementation Tipsy
@synthesize receipt;
@synthesize tipId;
@synthesize five,ten,fifteen,twenty;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertyDeclarations];
}
//MARK: - Property Declarations
-(void)propertyDeclarations{
    self.view.backgroundColor = [UIColor grayColor];
    
    float scrnHeight = UIScreen.mainScreen.bounds.size.height;
    float scrnWidth = UIScreen.mainScreen.bounds.size.width;
    
    UIButton *back = [[UIButton alloc]init];
    back.frame = CGRectMake(40, scrnHeight - 80, scrnWidth - 80, 50);
    [back addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    back.layer.cornerRadius = 8;
    back.backgroundColor = [UIColor blackColor];
    [self.view addSubview:back];
    
    UILabel *backLabel = [[UILabel alloc]init];
    backLabel.frame = CGRectMake(40, scrnHeight - 80, scrnWidth - 80, 50);
    backLabel.text = @"Go Back";
    backLabel.userInteractionEnabled = false;
    backLabel.textColor = [UIColor whiteColor];
    backLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:backLabel];
    
    UIButton *calculate = [[UIButton alloc]init];
    calculate.frame = CGRectMake(40, back.frame.origin.y - 80, scrnWidth - 80, 50);
    [calculate addTarget:self action:@selector(calculatePressed) forControlEvents:UIControlEventTouchUpInside];
    calculate.layer.cornerRadius = 8;
    calculate.backgroundColor = [UIColor blackColor];
    [self.view addSubview:calculate];
    
    UILabel *calcLabel = [[UILabel alloc]init];
    calcLabel.frame = calculate.frame;
    calcLabel.text = @"Calculate";
    calcLabel.textColor = [UIColor whiteColor];
    calcLabel.textAlignment = NSTextAlignmentCenter;
    calcLabel.userInteractionEnabled = false;
    [self.view addSubview:calcLabel];
    
    UILabel *text = [[UILabel alloc]init];
    text.frame = CGRectMake(40, 200, scrnWidth - 80, 20);
    text.textAlignment = NSTextAlignmentCenter;
    text.textColor = [UIColor whiteColor];
    text.text = @"Please enter all the details below: ";
    [self.view addSubview:text];
    
    UIToolbar *tfBar = [[UIToolbar alloc]init];
    [tfBar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(donePressed)];
    tfBar.items = @[flexBarButton, doneBarButton];
    
    receipt = [[UITextField alloc]init];
    receipt.frame = CGRectMake(40, text.frame.origin.y + 50, scrnWidth - 80, 50);
    receipt.placeholder = @"  Please enter the receipt amount";
    receipt.backgroundColor = [UIColor whiteColor];
    receipt.layer.cornerRadius = 8;
    receipt.delegate = self;
    receipt.keyboardType = UIKeyboardTypePhonePad;
    receipt.textAlignment = NSTextAlignmentCenter;
    receipt.inputAccessoryView = tfBar;
    [self.view addSubview:receipt];
    
    UIStackView *stack = [[UIStackView alloc]init];
    stack.frame = CGRectMake(40, receipt.frame.origin.y + 70, scrnWidth - 80, 40);
    [stack setAxis:UILayoutConstraintAxisHorizontal];
    stack.distribution = UIStackViewDistributionFillEqually;
    stack.alignment = UIStackViewAlignmentCenter;
    stack.spacing = 15;
    [self.view addSubview:stack];
    
    five = [[UIButton alloc]init];
    five.layer.cornerRadius = 8;
    five.backgroundColor = [UIColor whiteColor];
    [five setAttributedTitle:nil forState:UIControlStateNormal];
    [five setTitle:@"5%" forState:UIControlStateNormal];
    [five setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [five addTarget:self action:@selector(fivePressed) forControlEvents:UIControlEventTouchUpInside];
    [stack addArrangedSubview:five];
    
    ten = [[UIButton alloc]init];
    ten.layer.cornerRadius = 8;
    ten.backgroundColor = [UIColor whiteColor];
    [ten setAttributedTitle:nil forState:UIControlStateNormal];
    [ten setTitle:@"10%" forState:normal];
    [ten setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ten addTarget:self action:@selector(tenPressed) forControlEvents:UIControlEventTouchUpInside];
    [stack addArrangedSubview:ten];
    
    fifteen = [[UIButton alloc]init];
    fifteen.layer.cornerRadius = 8;
    fifteen.backgroundColor = [UIColor whiteColor];
    [fifteen setAttributedTitle:nil forState:UIControlStateNormal];
    [fifteen setTitle:@"15%" forState:normal];
    [fifteen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [fifteen addTarget:self action:@selector(fifteenPressed) forControlEvents:UIControlEventTouchUpInside];
    [stack addArrangedSubview:fifteen];
    
    twenty = [[UIButton alloc]init];
    twenty.layer.cornerRadius = 8;
    twenty.backgroundColor = [UIColor whiteColor];
    [twenty setAttributedTitle:nil forState:UIControlStateNormal];
    [twenty setTitle:@"20%" forState:normal];
    [twenty setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [twenty addTarget:self action:@selector(twentyPressed) forControlEvents:UIControlEventTouchUpInside];
    [stack addArrangedSubview:twenty];
    
    tipId = 5;
    [self reDraw];
}

//MARK: - The Class Related Target Methods
-(void)donePressed{
    [receipt resignFirstResponder];
}
-(void)backPressed{
    [self dismissViewControllerAnimated:true completion:nil];
}
-(void)calculatePressed{
    if (receipt.text.length < 1){
        [self alertIfEmpty];
        return;
    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    numberFormatter.maximumFractionDigits = 2;
    numberFormatter.roundingMode = NSNumberFormatterRoundUp;
    
    float value = [numberFormatter numberFromString:receipt.text].floatValue;
    float total = (value/100)*tipId + value;
    
    
    NSString *answer = [[NSString alloc]init];
    answer = [NSString stringWithFormat:@"%.02f", total];
    [self printResult:answer];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(void)fivePressed{
    self.tipId = 5;
    [self reDraw];
}
-(void)tenPressed{
    self.tipId = 10;
    [self reDraw];
}
-(void)fifteenPressed{
    self.tipId = 15;
    [self reDraw];
}
-(void)twentyPressed{
    self.tipId = 20;
    [self reDraw];
}
-(void)reDraw{
    self.five.backgroundColor = [UIColor whiteColor];
    [self.five setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.ten.backgroundColor = [UIColor whiteColor];
    [self.ten setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.fifteen.backgroundColor = [UIColor whiteColor];
    [self.fifteen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.twenty.backgroundColor = [UIColor whiteColor];
    [self.twenty setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    switch(tipId){
        case 5:
            self.five.backgroundColor = [UIColor blackColor];
            [self.five setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 10:
            self.ten.backgroundColor = [UIColor blackColor];
            [self.ten setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 15:
            self.fifteen.backgroundColor = [UIColor blackColor];
            [self.fifteen setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        default:
            self.twenty.backgroundColor = [UIColor blackColor];
            [self.twenty setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
    }
    //This lines are for haptic feedback
    UIImpactFeedbackGenerator *myGen = [[UIImpactFeedbackGenerator alloc] initWithStyle:(UIImpactFeedbackStyleLight)];
    [myGen impactOccurred];
    myGen = NULL;
}
-(void)alertIfEmpty{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Please enter receipt amount!"
                                   message:@""
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)printResult: (NSString *) answer{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"The Total receipt with tips included is:"
                                                                   message: [NSString stringWithFormat:@"%@ $", answer]
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
