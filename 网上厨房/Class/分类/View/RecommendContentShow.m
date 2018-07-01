//
//  RecommendContentShow.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/10.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "RecommendContentShow.h"

@interface RecommendContentShow()
@property(nonatomic,strong) UIButton *button;
@end

@implementation RecommendContentShow

- (instancetype)init{
    if (self = [super init]) {
        self.label0.font = [UIFont systemFontOfSize:18];
        self.label1.font = [UIFont systemFontOfSize:13];
        self.button.hidden = NO;
    }
    return self;
}

- (UIImageView *)imgaeView0{
    if (!_imgaeView0) {
        _imgaeView0 = [[UIImageView alloc] init];
        
        [self addSubview:_imgaeView0];
        [_imgaeView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _imgaeView0;
}

- (UIImageView *)imgaeView1{
    if (!_imgaeView1) {
        _imgaeView1 = [UIImageView new];
        
        [self.imgaeView0 addSubview:_imgaeView1];
        [_imgaeView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(25);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
    }
    return _imgaeView1;
}

- (UILabel *)label0{
    if (!_label0) {
        _label0 = [[UILabel alloc] init];
        _label1.textAlignment = NSTextAlignmentLeft;
        _label1.textColor = [UIColor blackColor];
        
        [self.imgaeView0 addSubview:_label0];
        [_label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.imgaeView1);
            make.left.mas_equalTo(self.imgaeView1.mas_right).mas_equalTo(8);
        }];
    }
    return _label0;
}

- (UILabel *)label1{
    if (!_label1) {
        _label1 = [UILabel new];
        _label1.textAlignment = NSTextAlignmentLeft;
        _label1.textColor = [UIColor lightGrayColor];
        
        [self.imgaeView0 addSubview:_label1];
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.mas_equalTo(self.imgaeView1);
            make.top.mas_equalTo(self.label0.mas_bottom).mas_equalTo(5);
        }];
    }
    return _label1;
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
