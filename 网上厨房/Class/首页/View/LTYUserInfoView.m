//
//  LTYUserInfoView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/4.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYUserInfoView.h"

@implementation LTYUserInfoView

- (instancetype)init{
    if (self = [super init]) {
        self.tagLabel.font = [UIFont systemFontOfSize:10];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tagLabel.font = [UIFont systemFontOfSize:10];
    }
    return self;
}

- (UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        [self addSubview:_userImageView];
        [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.size.mas_equalTo(60);
            make.centerY.mas_equalTo(-10);
        }];
        _userImageView.layer.cornerRadius = 30;
        _userImageView.clipsToBounds = YES;
    }
    return _userImageView;
}

- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [[UILabel alloc] init];
        [self addSubview:_nickName];
        [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.userImageView.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(5);
            
        }];
        _nickName.font = [UIFont systemFontOfSize:14];
        _nickName.textAlignment = NSTextAlignmentCenter;
        _nickName .textColor = [UIColor blackColor];
    }
    return _nickName;
}

- (UILabel *)tagLabel{
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] init];
        [self addSubview:_tagLabel];
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(self.nickName);
            make.top.mas_equalTo(self.nickName.mas_bottom).mas_equalTo(5);
        }];
        _tagLabel.textColor = [UIColor blackColor];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tagLabel;
}

@end
