//
//  ViewController.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/2/22.
//

#import "ViewController.h"
#import "Bmi.h"
#import "Tipsy.h"
#import "Fibonacci.h"
#import "TipsyAppObjc-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertyDeclarations];
    [self usingSwiftClassInObjc];
    // Do any additional setup after loading the view.
}
-(void)propertyDeclarations{
    self.view.backgroundColor = [UIColor whiteColor];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = UIScreen.mainScreen.bounds.size.height;
    
    UIButton *bmi = [UIButton buttonWithType:UIButtonTypeSystem];
    [bmi addTarget:self action:@selector(bmiPressed) forControlEvents:UIControlEventTouchUpInside];
    [bmi setFrame:CGRectMake(40, screenHeight/3 - 25, screenWidth - 80, 50)];
    bmi.backgroundColor = [UIColor grayColor];
    bmi.layer.cornerRadius = 8;
    [self.view addSubview:bmi];
    
    
    UILabel *bmiLabel = [[UILabel alloc]init];
    bmiLabel.frame = CGRectMake(40, screenHeight/3 - 25, screenWidth - 80, 50);
    bmiLabel.text = @"Calculate BMI";
    bmiLabel.userInteractionEnabled = NO;
    bmiLabel.textAlignment = NSTextAlignmentCenter;
    bmiLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:bmiLabel];
    
    UIButton *tipsy = [[UIButton alloc]init];
    [tipsy setFrame: CGRectMake(40, bmi.frame.origin.y + 80, screenWidth - 80, 50)];
    [tipsy addTarget:self action:@selector(tipsyPressed) forControlEvents:UIControlEventTouchUpInside];
    tipsy.backgroundColor = [UIColor grayColor];
    tipsy.layer.cornerRadius = 8;
    [self.view addSubview:tipsy];
    
    UILabel *tipsyLabel = [[UILabel alloc]init];
    tipsyLabel.frame = CGRectMake(40, bmi.frame.origin.y + 80, screenWidth - 80, 50);
    tipsyLabel.userInteractionEnabled = false;
    tipsyLabel.text = @"Tipsy App";
    tipsyLabel.textAlignment = NSTextAlignmentCenter;
    tipsyLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:tipsyLabel];
    
    UIButton *fibonacci = [[UIButton alloc]init];
    fibonacci.frame = CGRectMake(40, tipsy.frame.origin.y + 80, screenWidth - 80, 50);
    [fibonacci addTarget:self action:@selector(fibonacciPressed) forControlEvents:UIControlEventTouchUpInside];
    fibonacci.backgroundColor = [UIColor grayColor];
    fibonacci.layer.cornerRadius = 8;
    [self.view addSubview:fibonacci];
    
    UILabel *fibLabel = [[UILabel alloc]init];
    fibLabel.frame = CGRectMake(40, tipsy.frame.origin.y + 80, screenWidth - 80, 50);
    fibLabel.userInteractionEnabled = false;
    fibLabel.text = @"Fibonacci/Prime";
    fibLabel.textAlignment = NSTextAlignmentCenter;
    fibLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:fibLabel];
    
    UIButton *swift = [[UIButton alloc]init];
    swift.frame = CGRectMake(40, fibonacci.frame.origin.y + 80, screenWidth - 80, 50);
    [swift addTarget:self action:@selector(swiftPressed) forControlEvents:UIControlEventTouchUpInside];
    swift.backgroundColor = [UIColor grayColor];
    swift.layer.cornerRadius = 8;
    [self.view addSubview:swift];
    
    UILabel *swLabel = [[UILabel alloc]init];
    swLabel.frame = CGRectMake(40, fibonacci.frame.origin.y + 80, screenWidth - 80, 50);
    swLabel.userInteractionEnabled = false;
    swLabel.text = @"Swift Part";
    swLabel.textAlignment = NSTextAlignmentCenter;
    swLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:swLabel];
    
}

-(void)bmiPressed{
    NSLog(@"The bmi Pressed");
    Bmi *vc = [[Bmi alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:true completion:NULL];
}
-(void)tipsyPressed{
    NSLog(@"The Tipsy App");
    Tipsy *vc = [[Tipsy alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc  animated:true completion:NULL];
}
-(void)fibonacciPressed{
    NSLog(@"Prime/Fibonacci App");
    Fibonacci *vc = [[Fibonacci alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:true completion:NULL];
}
-(void)swiftPressed{
    NSLog(@"Swift pressed");
    MathVC *vc = [[MathVC alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:true completion:NULL];
}
-(void)usingSwiftClassInObjc{
    NSLog(@"Since it is learning project I will just implement all the stuff to be seen in terminal and exclude not necessary UIPart");
    Math *math = [[Math alloc]init];
    NSUInteger answer;
    answer = [math addWithNumOne:10 numTwo:10];
    NSLog(@"%lu", (unsigned long)answer);
    answer = [math subtractWithNumOne:15 numTwo:5];
    NSLog(@"%lu", answer);
    answer = [math divideWithNumOne:50 numTwo:5];
    NSLog(@"%lu", answer);
    float flNumber = [math multiplyWithNumOne:14 numTwo:10];
    NSLog(@"%f", flNumber);
}
@end
