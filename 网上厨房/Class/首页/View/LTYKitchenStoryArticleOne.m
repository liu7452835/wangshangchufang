//
//  LTYKitchenStoryArticleOne.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYKitchenStoryArticleOne.h"

@implementation LTYKitchenStoryArticleOne

- (instancetype)init{
    if (self =[super init]) {
        self.nickName.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

- (UIImageView *)backgroundImageViewOne{
    if (!_backgroundImageViewOne) {
        _backgroundImageViewOne = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageViewOne];
        [_backgroundImageViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
        }];
        _backgroundImageViewOne.layer.cornerRadius = 5;
        _backgroundImageViewOne.clipsToBounds = YES;
    }
    return _backgroundImageViewOne;
}

- (UIImageView *)backgroundImageViewTwo{
    if (!_backgroundImageViewTwo) {
        _backgroundImageViewTwo = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageViewTwo];
        [_backgroundImageViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(self.backgroundImageViewOne.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(self.backgroundImageViewOne.mas_centerY);
            make.width.mas_equalTo(self.backgroundImageViewOne.mas_width);
        }];
        _backgroundImageViewTwo.layer.cornerRadius = 5;
        _backgroundImageViewTwo.clipsToBounds = YES;
    }
    return _backgroundImageViewTwo;
}

- (UIImageView *)backgroundImageViewThree{
    if (!_backgroundImageViewThree) {
        _backgroundImageViewThree = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageViewThree];
        [_backgroundImageViewThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.mas_equalTo(0);
            make.left.mas_equalTo(self.backgroundImageViewTwo.mas_right).mas_equalTo(5);
            make.width.mas_equalTo(self.backgroundImageViewTwo.mas_width);
            make.centerY.mas_equalTo(self.backgroundImageViewTwo.mas_centerY);
        }];
        _backgroundImageViewThree.layer.cornerRadius = 5;
        _backgroundImageViewThree.clipsToBounds = YES;
    }
    return _backgroundImageViewThree;
}

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.backgroundImageViewThree.mas_bottom).mas_equalTo(5);
        }];
        _title.textColor = [UIColor blackColor];
        _title.font = [UIFont systemFontOfSize:13];
        _title.textAlignment = NSTextAlignmentLeft;
    }
    return _title;
}

- (UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [UIImageView new];
        [self addSubview:_userImageView];
        [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(5);
        }];
        _userImageView.layer.cornerRadius = 15;
        _userImageView.clipsToBounds = YES;
    }
    return _userImageView;
}

- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [[UILabel alloc] init];
        [self addSubview:_nickName];
        [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userImageView.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(self.userImageView.mas_centerY).mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
        _nickName.textColor = [UIColor grayColor];
        _nickName.textAlignment = NSTextAlignmentLeft;
    }
    return _nickName;
}

@end
