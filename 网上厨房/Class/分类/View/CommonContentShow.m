//
//  CommonContentShow.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/10.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "CommonContentShow.h"

@interface CommonContentShow()
@property(nonatomic,strong) UIButton *button;
@end

@implementation CommonContentShow


-(instancetype)init{
    if (self = [super init]) {
        _label.font = [UIFont systemFontOfSize:10];
        self.button.hidden = NO;
    }
    return self;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-15);
        }];
    }
    return _imageView;
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:10];
        
        [self.imageView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(14);
            make.left.mas_equalTo(12);
        }];
    }
    return _label;
}

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void) buttonClick{
    if ([self.delegate respondsToSelector:@selector(contentShowViewClick:)]) {
        [self.delegate contentShowViewClick:self.tag];
    }
}

@end
