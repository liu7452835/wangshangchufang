//
//  LTYRecommendViewCell.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTYRecommendView.h"

@protocol LTYRecommendViewCellDelegate<NSObject>
-(void)cellSelected;
@end


@interface LTYRecommendViewCell : UICollectionViewCell<UIScrollViewDelegate>
@property(nonatomic,strong) id<LTYRecommendViewCellDelegate> delegate;

//- (void) setUpCellWithArray:(NSArray *)array;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong) LTYRecommendView *allListView;
@end
