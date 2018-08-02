//
//  FocusImageScrollViewCell.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/30.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

/**
 *  封装焦点图(滚动视图)
 */
@interface FocusImageScrollView : UIView

/**
 *  通过传入焦点图数量,初始化一个View
 */
- (instancetype) initWithFocusImgNumber:(NSInteger)number;

/**
 通过传入需要滑动的图数量，初始化一个view（不需要自动滚动）
 */
//- (instancetype) initWithSlideImgNumber:(NSInteger)number;

// 给外界接受它的代理
@property(nonatomic,strong) iCarousel *ic;
@property(nonatomic,strong) UIPageControl *pageControl;

@end
