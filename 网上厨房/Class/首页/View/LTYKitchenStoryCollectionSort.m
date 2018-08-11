//
//  KitchenStory.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/8.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYKitchenStoryCollectionSort.h"

@implementation LTYKitchenStoryCollectionSort

- (instancetype)init{
    if (self = [super init]) {
        self.title.hidden = NO;
        self.nickName.font = [UIFont systemFontOfSize:12];
    }
    return self;
}


- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-40);
        }];
        _backgroundImageView.layer.cornerRadius = 5;
        _backgroundImageView.clipsToBounds = YES;
    }
    return _backgroundImageView;
}

- (UILabel *)foodCount{
    if (!_foodCount) {
        _foodCount = [[UILabel alloc] init];
        [self.backgroundImageView addSubview:_foodCount];
        [_foodCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-5);
        }];
        _foodCount.textColor = [UIColor whiteColor];
        _foodCount.font = [UIFont systemFontOfSize:13];
        _foodCount.textAlignment = NSTextAlignmentLeft;
    }
    return _foodCount;
}

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        [self.backgroundImageView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.foodCount);
            make.rightMargin.mas_equalTo(0);
            make.bottom.mas_equalTo(self.foodCount.mas_top).mas_equalTo(0);
        }];
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont systemFontOfSize:15];
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
