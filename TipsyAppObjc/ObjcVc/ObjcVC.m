//
//  ObjcVC.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/4/22.
//

#import "ObjcVC.h"

@interface ObjcVC ()

@end

@implementation ObjcVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    [self welcome];
}
-(void)welcome{
    NSLog(@"You are now in Objc Territory!");
}
-(void)rocketLaunch{
    NSLog(@"1..2..3... Rocket is launched");
}
@end
