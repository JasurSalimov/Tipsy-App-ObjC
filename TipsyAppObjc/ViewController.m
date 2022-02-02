//
//  ViewController.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/2/22.
//

#import "ViewController.h"
#import "Bmi.h"
#import "Tipsy.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertyDeclarations];
    // Do any additional setup after loading the view.
}
-(void)propertyDeclarations{
    self.view.backgroundColor = [UIColor whiteColor];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = UIScreen.mainScreen.bounds.size.height;
    
    UIButton *bmi = [UIButton buttonWithType:UIButtonTypeSystem];
    [bmi addTarget:self action:@selector(bmiPressed) forControlEvents:UIControlEventTouchUpInside];
    [bmi setFrame:CGRectMake(40, screenHeight/2 - 25, screenWidth - 80, 50)];
    bmi.backgroundColor = [UIColor grayColor];
    bmi.layer.cornerRadius = 8;
    [self.view addSubview:bmi];
    
    
    UILabel *bmiLabel = [[UILabel alloc]init];
    bmiLabel.frame = CGRectMake(40, screenHeight/2 - 25, screenWidth - 80, 50);
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
@end