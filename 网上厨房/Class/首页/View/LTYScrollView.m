//
//  LTYScrollView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/31.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYScrollView.h"

@interface LTYScrollView()
@property(nonatomic,strong) UILabel *backgroundLabel;
@end

@implementation LTYScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.starImageView.hidden = NO;
        self.nickName.font = [UIFont systemFontOfSize:12];
        self.vipTagView.hidden = NO;
        self.cookTitle.hidden = NO;
    }
    return self;
}

- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [UIImageView new];
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _backgroundImageView.tag = 100;
        _backgroundImageView.clipsToBounds = YES;
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroundImageView;
}

- (UILabel *)backgroundLabel{
    if (!_backgroundLabel) {
        _backgroundLabel = [UILabel new];
        [self.backgroundImageView addSubview:_backgroundLabel];
        [_backgroundLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.height.mas_equalTo(40);
        }];
        _backgroundLabel.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.4];
        return _backgroundLabel;
    }
    return _backgroundLabel;
}

-(UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        [self.backgroundLabel addSubview:_userImageView];
        [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(15);
        }];
        _userImageView.tag = 200;
        _userImageView.layer.cornerRadius = 15.0;
        _userImageView.layer.masksToBounds = YES;
    }
    return _userImageView;
}

- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [UILabel new];
        [self.backgroundLabel addSubview:_nickName];
        [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userImageView.mas_right).mas_equalTo(5);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(60);
        }];
        _nickName.tag = 300;
        _nickName.textColor = [UIColor whiteColor];
    }
    return _nickName;
}

- (UIImageView *)starImageView{
    if (!_starImageView) {
        _starImageView = [[UIImageView alloc]init];
        [self.backgroundLabel addSubview:_starImageView];
        [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.leftMargin.mas_equalTo(self.nickName.mas_leftMargin).mas_equalTo(0);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(10);
            make.top.mas_equalTo(self.nickName.mas_bottom).mas_equalTo(0);
           
        }];
        _starImageView.tag = 400;
        _starImageView.contentMode = UIViewContentModeLeft;
    }
    return _starImageView;
}

-(UILabel *)cookTitle{
    if (!_cookTitle) {
        _cookTitle = [[UILabel alloc] init];
        [self.backgroundLabel addSubview:_cookTitle];
        [_cookTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.centerX.mas_equalTo(0);
            make.leftMargin.mas_equalTo(self.nickName.mas_rightMargin).mas_equalTo(10);
        }];
        _cookTitle.textAlignment = NSTextAlignmentLeft;
        _cookTitle.textColor = [UIColor whiteColor];
        _cookTitle.tag = 500;
    }
    return _cookTitle;
}

- (UIImageView *)vipTagView{
    if (!_vipTagView) {
        _vipTagView = [[UIImageView alloc] init];
        [self.userImageView addSubview:_vipTagView];
        [_vipTagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(5, 5));
        }];
        _vipTagView.tag = 600;
    }
    return _vipTagView;
}

@end
