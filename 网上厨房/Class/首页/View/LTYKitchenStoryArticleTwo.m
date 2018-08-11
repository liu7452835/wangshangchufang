//
//  LTYKitchenStoryArticleTwo.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYKitchenStoryArticleTwo.h"

@interface LTYKitchenStoryArticleTwo()

@property(nonatomic,strong) UIImageView *playButton;

@end

@implementation LTYKitchenStoryArticleTwo

- (instancetype)init{
    if (self = [super init]) {
        [self.playButton setImage:[UIImage imageNamed:@"common_video"]];
    }
    return self;
}

- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
        }];
        _backgroundImageView.layer.cornerRadius = 5;
        _backgroundImageView.clipsToBounds = YES;
    }
    return _backgroundImageView;
}

-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        [self.backgroundImageView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_equalTo(10);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-7);
        }];
        _title.textColor = [UIColor whiteColor];
        _title.font = [UIFont systemFontOfSize:15];
        _title.textAlignment = NSTextAlignmentLeft;
    }
    return _title;
}

- (UIImageView *)playButton{
    if (!_playButton) {
        _playButton = [[UIImageView alloc] init];
        [self.backgroundImageView addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        _playButton.layer.cornerRadius = 20;
        _playButton.clipsToBounds = YES;
    }
    return _playButton;
}

- (void)setIsHideVideo:(BOOL)isHideVideo{
    _isHideVideo = isHideVideo;
    self.playButton.hidden = isHideVideo;
}

- (UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [UIImageView new];
        [self addSubview:_userImageView];
        [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(self.backgroundImageView.mas_bottom).mas_equalTo(5);
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
            make.centerY.mas_equalTo(self.userImageView.mas_centerY).mas_equalTo(-5);
            make.right.mas_equalTo(0);
        }];
        _nickName.textColor = [UIColor grayColor];
        _nickName.textAlignment = NSTextAlignmentLeft;
        _nickName.font = [UIFont systemFontOfSize:12];
    }
    return _nickName;
}

- (UIImageView *)starImageView{
    if (!_starImageView) {
        _starImageView = [[UIImageView alloc]init];
        [self addSubview:_starImageView];
        [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.nickName.mas_leftMargin);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(10);
            make.top.mas_equalTo(self.nickName.mas_bottom);
        }];
        _starImageView.contentMode = UIViewContentModeLeft;
    }
    return _starImageView;
}

@end
