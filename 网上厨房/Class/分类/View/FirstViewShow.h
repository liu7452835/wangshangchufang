//
//  FirstViewShow.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol sortFirstVeiwDelegate<NSObject>

- (void) contentShowViewClick:(NSInteger)tag;//点击图片按钮跳转

@end

@interface FirstViewShow : UIView

@property(nonatomic,strong) UIImageView *imageView0;

@property(nonatomic,weak)id<sortFirstVeiwDelegate> delegate;

@end
