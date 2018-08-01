//
//  LTYHomeViewModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/29.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseViewModel.h"

@interface LTYHomeViewModel : BaseViewModel

//获得表头视图中标签文字
- (NSString *) headViewTagLabelForIndex:(NSInteger)index;
//获得表头视图中图片url地址
- (NSURL *) headViewTagImageViewForIndex:(NSInteger)index;

//获得滚动视图中背景图片url地址
- (NSURL *) scrollViewImageURLForIndex :(NSInteger)index;
//获得滚动视图中作者图片url地址
- (NSURL *) scrollViewUserImageURLForIndex :(NSInteger)index;
//获得滚动视图中作者名称
-(NSString *) nickNameForIndex :(NSInteger)index;
//获得滚动视图中星级图片
-(UIImage *) starImageForIndex :(NSInteger)index;
//获得滚动视图中标题
-(NSString *) cookTitleForIndex :(NSInteger)index;

//获得早餐视图中背景图片url地址
- (NSURL *) breakfastViewBackgroundImageURLForIndex:(NSInteger)index;




//表头视图item数量
@property(nonatomic,assign) NSInteger tagCount;

//滚动视图中滚动图片数量
@property(nonatomic,assign) NSInteger numberOfItemsInScrollView;

@end
