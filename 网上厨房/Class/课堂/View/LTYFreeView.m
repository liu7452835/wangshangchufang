//
//  LTYFreeView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/17.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYFreeView.h"

@implementation LTYFreeView

- (instancetype)init{
    if (self = [super init]) {
        self.timeLabel.font = [UIFont systemFontOfSize:8];
        self.timeLabel.textColor = [UIColor lightGrayColor];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        [self addSubview:_timeLabel];
        [self.idImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(5);
            make.leftMargin.mas_equalTo(self.title.mas_leftMargin).mas_equalTo(40);
        }];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.idImageView.mas_bottom).mas_equalTo(10);
        }];
    }
    return _timeLabel;
}

@end
