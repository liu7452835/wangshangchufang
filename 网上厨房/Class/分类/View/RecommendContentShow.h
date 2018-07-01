//
//  RecommendContentShow.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/10.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecommendContentShowDelegate<NSObject>

- (void) contentShowViewClick:(NSInteger)tag;//点击图片按钮跳转

@end

@interface RecommendContentShow : UIView

@property(nonatomic,strong) UIImageView *imgaeView0;
@property(nonatomic,strong) UIImageView *imgaeView1;
@property(nonatomic,strong) UILabel *label0;
@property(nonatomic,strong) UILabel *label1;

@property(nonatomic,weak) id<RecommendContentShowDelegate> delegate;

@end
