//
//  Bmi.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/2/22.
//

#import "Bmi.h"

@interface Bmi ()

@end

@implementation Bmi
@synthesize weightTF, heightTF;
@synthesize bmiValue;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertyDeclarations];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)propertyDeclarations{
    self.view.backgroundColor = [UIColor grayColor];
    
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = UIScreen.mainScreen.bounds.size.height;
    
    UILabel *text = [[UILabel alloc] init];
    text.text = @"Please enter your bmi.";
    text.frame = CGRectMake(40, 200, screenWidth - 80, 20);
    [text setFont:[UIFont fontWithName:@"system " size:20]];
    text.textColor = [UIColor whiteColor];
    text.textAlignment = NSTextAlignmentCenter;
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
    
    weightTF = [[UITextField alloc]init];
    weightTF.frame = CGRectMake(40, text.frame.origin.y + 50, screenWidth - 80, 50);
    weightTF.placeholder = @"  Please enter your weight in kg";
    weightTF.delegate = self;
    weightTF.layer.cornerRadius = 8;
    weightTF.textAlignment = NSTextAlignmentCenter;
    weightTF.backgroundColor = [UIColor whiteColor];
    weightTF.keyboardType = UIKeyboardTypePhonePad;
    weightTF.inputAccessoryView = tfBar;
    [self.view addSubview:weightTF];
    
    heightTF = [[UITextField alloc]init];
    heightTF.frame = CGRectMake(40, weightTF.frame.origin.y + 80 , screenWidth - 80, 50);
    heightTF.placeholder = @"  Please enter your height in cm";
    heightTF.delegate = self;
    heightTF.backgroundColor = [UIColor whiteColor];
    heightTF.layer.cornerRadius = 8;
    heightTF.textAlignment = NSTextAlignmentCenter;
    heightTF.keyboardType = UIKeyboardTypePhonePad;
    heightTF.inputAccessoryView = tfBar;
    [self.view addSubview:heightTF];
    
    UIButton *back = [[UIButton alloc]init];
    back.frame = CGRectMake(40, screenHeight - 80, screenWidth - 80, 50);
    back.backgroundColor = [UIColor blackColor];
    back.layer.cornerRadius = 8;
    [back addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UILabel *backLabel = [[UILabel alloc]init];
    backLabel.frame = CGRectMake(40, screenHeight - 80, screenWidth - 80, 50);
    backLabel.text = @"Go Back";
    backLabel.textColor = [UIColor whiteColor];
    backLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:backLabel];
    
    UIButton *calculate = [[UIButton alloc]init];
    calculate.frame = CGRectMake(40, back.frame.origin.y - 80, screenWidth - 80, 50);
    calculate.layer.cornerRadius = 8;
    calculate.backgroundColor = [UIColor blackColor];
    [calculate addTarget:self action:@selector(calculatePressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:calculate];
    
    UILabel *calcLabel = [[UILabel alloc]init];
    calcLabel.frame = CGRectMake(40, back.frame.origin.y - 80, screenWidth - 80, 50);
    calcLabel.text = @"Calculate";
    calcLabel.userInteractionEnabled = false;
    calcLabel.textAlignment = NSTextAlignmentCenter;
    calcLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:calcLabel];
    
    
    
    
}
-(void)donePressed{
    [weightTF resignFirstResponder];
    [heightTF resignFirstResponder];
}
-(void)backPressed{
    //dismiss the screen
    [self dismissViewControllerAnimated:true completion:NULL];
}
-(void)calculatePressed{
//    bmiValue =
    if (weightTF.text.length > 0 && heightTF.text.length > 0){
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        float weight = [numberFormatter numberFromString:weightTF.text].floatValue;
        float height = [numberFormatter numberFromString:heightTF.text].floatValue;
        
        bmiValue = ((weight)*((height/100)*(height/100))/10);
        [self alert];
    }
    //calculate the value if the value is empty delete;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(void)alert{
    NSString *string = [NSString stringWithFormat:@" %@ percentage of your body!", [NSString stringWithFormat:@"%.02f", bmiValue]];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Your BMI:"
                                   message:string
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
