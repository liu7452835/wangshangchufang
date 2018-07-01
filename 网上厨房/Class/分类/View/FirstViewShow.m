//
//  FirstViewShow.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "FirstViewShow.h"

@interface FirstViewShow()

@property(nonatomic,strong) UIImageView *imageView1;
@property(nonatomic,strong) UILabel *label0;
@property(nonatomic,strong) UILabel *label1;
@property(nonatomic,strong) UIButton *button;

@end

@implementation FirstViewShow

- (instancetype)init{
    if (self = [super init]) {
        self.label0.font = [UIFont systemFontOfSize:18];
        self.label1.font = [UIFont systemFontOfSize:13];
        self.button.hidden = NO;
    }
    return self;
}

- (UIImageView *)imageView0{
    if (!_imageView0) {
        _imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic_video"]];
        [self addSubview:_imageView0];
        [_imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _imageView0;
}

- (UIImageView *)imageView1{
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sort_video"]];
        [self.imageView0 addSubview:_imageView1];
        [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView0).mas_equalTo(50);
            make.left.mas_equalTo(self.imageView0).mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
    }
    return _imageView1;
}

- (UILabel *)label0{
    if (!_label0) {
        _label0 = [[UILabel alloc] init];
        _label0.text = @"视频菜谱";
        [self.imageView0 addSubview:_label0];
        [_label0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.imageView1);
            make.left.mas_equalTo(self.imageView1.mas_right).mas_equalTo(6);
        }];
    }
    return _label0;
}

- (UILabel *)label1{
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.text = @"大厨视频传授私房秘诀";
        _label1.textAlignment = NSTextAlignmentLeft;
        _label1.textColor = [UIColor lightGrayColor];
        
        [self.imageView0 addSubview:_label1];
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leadingMargin.mas_equalTo(self.imageView1);
            make.top.mas_equalTo(self.imageView1.mas_bottom).mas_equalTo(15);
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
