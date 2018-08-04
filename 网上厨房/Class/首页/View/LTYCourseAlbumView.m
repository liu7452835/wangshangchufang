//
//  LTYCourseAlbumView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/1.
//  Copyright © 2018年 刘天宇. All rights reserved.
//


#import "LTYCourseAlbumView.h"


@implementation LTYCourseAlbumView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.courseNumberLabel.font = [UIFont systemFontOfSize:13];
        self.courseTitleLabel.font = [UIFont systemFontOfSize:16];
        
    }
    return self;
}


- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(-self.bounds.size.height/5);
        }];
        _backgroundImageView.tag = 100;
        _backgroundImageView.layer.cornerRadius = 5;
        _backgroundImageView.clipsToBounds = YES;
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroundImageView;
}

- (UILabel *)courseNumberLabel{
    if (!_courseNumberLabel) {
        _courseNumberLabel = [UILabel new];
        [self.backgroundImageView addSubview:_courseNumberLabel];
        [_courseNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.left.mas_equalTo(10);
            make.height.mas_equalTo(25);
        }];
        _courseNumberLabel.tag = 200;
        _courseNumberLabel.layer.cornerRadius = 4;
        _courseNumberLabel.clipsToBounds = YES;
        _courseNumberLabel.textColor = [UIColor whiteColor];
        _courseNumberLabel .backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
        _courseNumberLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _courseNumberLabel;
}


- (UILabel *)courseTitleLabel{
    if (!_courseTitleLabel) {
        _courseTitleLabel = [UILabel new];
        [self addSubview:_courseTitleLabel];
        [_courseTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.backgroundImageView.mas_bottom).mas_equalTo(5);
        }];
        _courseTitleLabel.tag = 300;
        _courseTitleLabel.numberOfLines = 2;
        _courseTitleLabel.textColor = [UIColor blackColor];
    }
    return _courseTitleLabel;
}

@end
