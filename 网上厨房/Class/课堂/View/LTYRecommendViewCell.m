//
//  LTYRecommendViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYRecommendViewCell.h"
#import "LTYRecommendView.h"

@implementation LTYRecommendViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    self.scrollView.bounces = NO;
    
}


@end
