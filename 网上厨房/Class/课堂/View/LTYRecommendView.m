//
//  LTYRecommendView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/13.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYRecommendView.h"

@implementation LTYRecommendView

- (instancetype)init{
    if (self = [super init]) {
        self.starImageView.hidden = NO;
        self.nickName.font = [UIFont systemFontOfSize:10];
        self.nickName.textColor = [UIColor lightGrayColor];
        self.title.font = [UIFont systemFontOfSize:12];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.starImageView.contentMode = UIViewContentModeLeft;
    }
    return self;
}

- (UIImageView *)recommendBackgroundImageView{
    if (!_recommendBackgroundImageView) {
        _recommendBackgroundImageView = [UIImageView new];
       
        [self addSubview:_recommendBackgroundImageView];
        [_recommendBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            //make.height.mas_equalTo(self.backgroundWidth);
        }];
        
    }
    return _recommendBackgroundImageView;
}

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(self.recommendBackgroundImageView);
            make.top.mas_equalTo(self.recommendBackgroundImageView.mas_bottom).mas_equalTo(5);
        }];
    }
    return _title;
}

-(UIImageView *)idImageView{
    if (!_idImageView) {
        _idImageView = [[UIImageView alloc] init];
        [self addSubview:_idImageView];
        [_idImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-10);
            make.leftMargin.mas_equalTo(self.title.mas_leftMargin).mas_equalTo(40);
        }];
        _idImageView.layer.cornerRadius = 15.0;
        _idImageView.layer.masksToBounds = YES;
    }
    return _idImageView;
}

- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [UILabel new];
        [self addSubview:_nickName];
        [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.idImageView.mas_right).mas_equalTo(10);
            make.rightMargin.mas_equalTo(self.title);
            make.topMargin.mas_equalTo(self.idImageView);
        }];
    }
    return _nickName;
}

- (UIImageView *)starImageView{
    if (!_starImageView) {
        _starImageView = [[UIImageView alloc]init];
        [self addSubview:_starImageView];
        [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.idImageView.mas_right).mas_equalTo(10);
            //make.bottom.mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.title);
            make.top.mas_equalTo(self.nickName.mas_bottom).mas_equalTo(4);
            //make.height.mas_equalTo(15);
        }];
    }
    return _starImageView;
}

- (NSUInteger)backgroundWidth{
    if(!_backgroundWidth){
        _backgroundWidth = 230;
    }
    return _backgroundWidth;
}

@end
