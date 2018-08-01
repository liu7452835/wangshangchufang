
//
//  LTYTagView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/28.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTagView.h"

@interface LTYTagView()

@property(nonatomic,strong) UIButton *button;

@end

@implementation LTYTagView

- (instancetype)init{
    if (self = [super init]) {
        self.label.font = [UIFont systemFontOfSize:12];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.button.hidden = NO;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.label.font = [UIFont systemFontOfSize:12];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.button.hidden = NO;
    }
    return self;
}

#pragma mark - 点击方法

-(void) buttonClick{
    if ([self.delegate respondsToSelector:@selector(tagViewDidClick:)]) {
        [self.delegate tagViewDidClick:self.tag];
    }
}

#pragma mark -lazeLoad

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(0);
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


@end
