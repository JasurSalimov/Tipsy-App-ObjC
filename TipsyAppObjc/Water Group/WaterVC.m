//
//  WaterVC.m
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/8/22.
//

#import "WaterVC.h"
#import  "TipsyAppObjc-Swift.h"
@interface WaterVC ()
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                 blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                alpha:1.0]
@end

@implementation WaterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertyDeclarations];
    // Do any additional setup after loading the view from its nib.
}

-(void)propertyDeclarations{
//    [self.view setBackgroundColor:[UIColor colorWithRed:33/255 green:33/255 blue:33/255 alpha:0.6]]
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
   _collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
   [_collectionView setDataSource:self];
   [_collectionView setDelegate:self];
    [_collectionView registerNib:[UINib nibWithNibName:@"WaterCell" bundle:NULL] forCellWithReuseIdentifier:@"WaterCell"];
   [_collectionView setBackgroundColor:[UIColor clearColor]];
   [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WaterCell" forIndexPath:indexPath];
//    ((WaterCell *)cell).frame = CGRectMake(0, 0, 0, 0);
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    float width = UIScreen.mainScreen.bounds.size.width;
    return CGSizeMake(width, 215.5);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(50, 0, 0, 0);
}
@end
