
//
//  LTYTagView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/28.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTagView.h"

@implementation LTYTagView

- (instancetype)init{
    if (self = [super init]) {
        self.label.font = [UIFont systemFontOfSize:12];
        self.label.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.label.font = [UIFont systemFontOfSize:12];
        self.label.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(33, 33));
        }];
        _imageView.backgroundColor = [UIColor whiteColor];
    }
    return _imageView;
}


- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.imageView.mas_bottomMargin).mas_equalTo(5);
            make.centerX.mas_equalTo(0);
            make.size.width.mas_equalTo(50);
        }];
    }
    return _label;
}

@end
