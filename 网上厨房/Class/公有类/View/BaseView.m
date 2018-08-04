//
//  BaseView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/1.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init{
    if (self = [super init]) {
        self.nickName.font = [UIFont systemFontOfSize:12];
        self.title.font = [UIFont systemFontOfSize:15];
        self.starImageView.contentMode = UIViewContentModeLeft;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.nickName.font = [UIFont systemFontOfSize:12];
        self.title.font = [UIFont systemFontOfSize:15];
        self.starImageView.contentMode = UIViewContentModeLeft;
       
    };
    return self;
}

- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [UIImageView new];
        
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-65);
        }];
        _backgroundImageView.layer.cornerRadius = 4;
        _backgroundImageView.clipsToBounds = YES;
        _backgroundImageView.tag = 100;
        _backgroundImageView.contentMode =UIViewContentModeScaleAspectFill;
        _backgroundImageView.clipsToBounds = YES;
    }
    return _backgroundImageView;
}


- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.backgroundImageView.mas_bottom).mas_equalTo(5);
            make.height.mas_equalTo(20);
        }];
        _title.tag = 200;
        _title.textAlignment = NSTextAlignmentCenter;
        _title.textColor = [UIColor blackColor];
    }
    return _title;
}
-(UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        [self addSubview:_userImageView];
        [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(5);
            make.centerX.mas_equalTo(-20);
        }];
        _userImageView.tag = 300;
        _userImageView.layer.cornerRadius = 15.0;
        _userImageView.layer.masksToBounds = YES;
    }
    return _userImageView;
}

- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [UILabel new];
        [self addSubview:_nickName];
        [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userImageView.mas_right).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.title);
            make.centerY.mas_equalTo(self.userImageView).mas_equalTo(-5);
            make.height.mas_equalTo(15);
        }];
        _nickName.tag = 400;
        _nickName.textColor = [UIColor lightGrayColor];
        _nickName.textAlignment = NSTextAlignmentLeft;
    }
    return _nickName;
}

- (UIImageView *)starImageView{
    if (!_starImageView) {
        _starImageView = [[UIImageView alloc]init];
        [self addSubview:_starImageView];
        [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.nickName);
            make.rightMargin.mas_equalTo(self.title);
            make.top.mas_equalTo(self.nickName.mas_bottom).mas_equalTo(4);
            make.height.mas_equalTo(8);
            
        }];
        _starImageView.tag = 500;
        _starImageView.contentMode = UIViewContentModeScaleAspectFit;
        _starImageView.clipsToBounds =YES;
    }
    return _starImageView;
}

@end
