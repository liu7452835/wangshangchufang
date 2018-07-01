//
//  CommonContentShow.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/10.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommonContentShowDelegate<NSObject>
- (void) contentShowViewClick:(NSInteger)tag;//点击图片按钮跳转
@end

@interface CommonContentShow : UIView

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UILabel *label;

@property(nonatomic,weak) id<CommonContentShowDelegate> delegate;
@end
