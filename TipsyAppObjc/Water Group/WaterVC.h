//
//  WaterVC.h
//  TipsyAppObjc
//
//  Created by Jasur Salimov on 2/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WaterVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property UICollectionView *collectionView;
@end

NS_ASSUME_NONNULL_END
