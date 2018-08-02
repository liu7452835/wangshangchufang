//
//  FocusImageScrollViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/30.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "FocusImageScrollView.h"


@implementation FocusImageScrollView
{// 定义完全私有的属性 : 添加成员变量,因为不需要懒加载,所以不需要是属性
    NSTimer *_timer;
}

- (instancetype)initWithFocusImgNumber:(NSInteger)number{
    if (self = [super init]) {
        //先关闭自己已存在的定时器
        [_timer invalidate];
        //当前没有需要滚动的视图，返回空对象nil
        if (!number) {
            return nil;
        }
        
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth/2);//frame指cell中区域可以交互的区域
        
        //添加滚动栏
        _ic = [[iCarousel alloc]init];
        [self addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //如果只有一张图，则不可以滚动
        _ic.scrollEnabled = number !=1;
        //手动翻页时，让图片一张一张滚，默认为NO,滚一次到尾
        _ic.pagingEnabled = YES;
        
        _ic.type = iCarouselTypeCustom;
        
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = number;
        
        [_ic addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-10);
            make.height.mas_equalTo(10);
        }];
        //如果只有一张图，则不显示原点
        _pageControl.hidesForSinglePage = YES;
        //小圆点不与用户交互
        _pageControl.userInteractionEnabled = NO;
        //小圆点颜色
        _pageControl.pageIndicatorTintColor = [UIColor lightTextColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        
        //计时器产生，开始启动
        if (number >1) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
                [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
            }];
        }
    }
    return self;
}

@end
