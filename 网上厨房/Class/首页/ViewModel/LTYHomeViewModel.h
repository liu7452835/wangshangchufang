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



//表头视图item数量
@property(nonatomic,assign) NSInteger tagCount;

@end
