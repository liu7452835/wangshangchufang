//
//  LTYFreeViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/17.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYFreeViewCell.h"

@implementation LTYFreeViewCell

- (LTYFreeView *)freeView{
    if (!_freeView) {
        _freeView = [[LTYFreeView alloc] init];
        [self.contentView addSubview:_freeView];
        [_freeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _freeView;
}

@end
