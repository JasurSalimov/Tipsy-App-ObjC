//
//  Fibonacci.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/3/22.
//

#import "Fibonacci.h"
#import "Foundation/Foundation.h"
#import "ViewController.h"
@implementation Fibonacci
@synthesize tf;
-(void)viewDidLoad{
    [super viewDidLoad];
    [self propertyDeclarations];
}
-(void)propertyDeclarations{
    self.view.backgroundColor = [UIColor grayColor];
    float height = UIScreen.mainScreen.bounds.size.height;
    float width = UIScreen.mainScreen.bounds.size.width;
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(40, 200, width - 80, 68);
    label.text = @"The answer for your number is only visible in debug. The app is for study purposes only";
    label.numberOfLines = 3;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    [toolBar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self action:@selector(donePressed)];
    toolBar.items = @[flexBarButton, doneBarButton];
    
    tf = [[UITextField alloc]init];
    tf.frame = CGRectMake(40, 300, width - 80, 50);
    tf.placeholder = @"  Please enter number";
    tf.inputAccessoryView = toolBar;
    tf.keyboardType = UIKeyboardTypePhonePad;
    tf.backgroundColor = [UIColor whiteColor];
    tf.textAlignment = NSTextAlignmentCenter;
    tf.layer.cornerRadius = 10;
    [self.view addSubview:tf];
    
    UIButton *back = [[UIButton alloc]init];
    back.frame = CGRectMake(40, height - 80, width - 80, 50);
    back.backgroundColor = [UIColor blackColor];
    back.layer.cornerRadius = 8;
    [back addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UILabel *backLabel = [[UILabel alloc]init];
    backLabel.frame = CGRectMake(40, height - 80, width - 80, 50);
    backLabel.text = @"Go Back";
    backLabel.textColor = [UIColor whiteColor];
    backLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:backLabel];
    
    UIButton *calculate = [[UIButton alloc]init];
    calculate.frame = CGRectMake(40, back.frame.origin.y - 80, width - 80, 50);
    calculate.layer.cornerRadius = 8;
    calculate.backgroundColor = [UIColor blackColor];
    [calculate addTarget:self action:@selector(calculatePressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:calculate];
    
    UILabel *calcLabel = [[UILabel alloc]init];
    calcLabel.frame = CGRectMake(40, back.frame.origin.y - 80, width - 80, 50);
    calcLabel.text = @"Calculate";
    calcLabel.userInteractionEnabled = false;
    calcLabel.textAlignment = NSTextAlignmentCenter;
    calcLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:calcLabel];
    
}

-(void)calculatePressed{
    if (tf.text.length < 1){
        [self alert];
        return;
    }
    int answer = [tf.text intValue];
    [self Fibonacci:answer];
    [self PrimeNumbers:answer];
}
-(void)Fibonacci: (int)number{
    int first = 0;
    int second = 1;
    int third = 1;
    NSLog(@"The fibonacci sequence till number is: %i,%i,", first,second);
    while(third < number){
        NSLog(@"%i,",third);
        first = second;
        second = third;
        third = first + second;
    }
    NSLog(@"----------- finished ----------");
}
-(void)PrimeNumbers: (int)number{
    NSLog(@"Prime numbers till give number are: ");
    for(int count = 1; count <= number; count ++){
        int isPrime = 0;
        for(int i = 1;i < count; i++){
            if(count%i == 0){
                isPrime++;
            }
            if(isPrime>2){
                break;
            }
        }
        if(isPrime < 2){
            NSLog(@"%i,",count);
        }
    }
}
-(void)backPressed{
    [self dismissViewControllerAnimated:true completion:NULL];
}
-(void)donePressed{
    [tf resignFirstResponder];
}
-(void)alert{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Please enter number!"
                                   message:@""
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
