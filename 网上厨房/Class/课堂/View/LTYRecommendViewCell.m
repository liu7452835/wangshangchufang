//
//  LTYRecommendViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYRecommendViewCell.h"


@implementation LTYRecommendViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    self.scrollView.bounces = NO;
    
}

- (LTYRecommendView *)allListView{
    if (!_allListView) {
        _allListView = [LTYRecommendView new];
        [self.contentView addSubview:_allListView];
        [_allListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _allListView;
}

@end
