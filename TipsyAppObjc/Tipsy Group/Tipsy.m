//
//  Tipsy.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/2/22.
//

#import "Tipsy.h"

@interface Tipsy ()

@end

@implementation Tipsy
@synthesize receipt;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertyDeclarations];
}
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
    receipt.textAlignment = NSTextAlignmentCenter;
    receipt.inputAccessoryView = tfBar;
    [self.view addSubview:receipt];
    
    UIStackView *stack = [[UIStackView alloc]init];
    stack.frame = CGRectMake(40, receipt.frame.origin.y + 70, scrnWidth - 80, 24);
    [self.view addSubview:stack];
    
    
    
    
    
}
-(void)donePressed{
    [receipt resignFirstResponder];
}
-(void)backPressed{
    [self dismissViewControllerAnimated:true completion:nil];
}
-(void)calculatePressed{
    //calculate
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
@end
