//
//  HeadView.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/1.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (instancetype)init{
    if (self = [super init]) {
        self.leftTitle.font = [UIFont systemFontOfSize:18];
        self.rightTitle.font = [UIFont systemFontOfSize:14];
        self.rightTitle.text = @"查看更多";
        [self.rightImage setImage:[UIImage imageNamed:@"me_more"]];
    }
    return self;
}

- (UILabel *)leftTitle{
    if (!_leftTitle) {
        _leftTitle = [UILabel new];
        [self addSubview:_leftTitle];
        [_leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(kScreenWidth / 2-10);
            make.left.mas_equalTo(10);
        }];
        _leftTitle.textColor = [UIColor blackColor];
        _leftTitle.textAlignment = NSTextAlignmentLeft;
    }
    return _leftTitle;
}

- (UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc] init];
        [self addSubview:_rightImage];
        [_rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-5);
            make.width.height.mas_equalTo(15);
        }];
        _rightImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _rightImage;
}

- (UILabel *)rightTitle{
    if (!_rightTitle) {
        _rightTitle = [[UILabel alloc] init];
        [self addSubview:_rightTitle];
        [_rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.rightImage.mas_left).mas_equalTo(-5);
            make.bottom.mas_equalTo(-5);
            make.height.mas_equalTo(15);
            make.left.mas_equalTo(self.leftTitle);
        }];
        _rightTitle.textColor = [UIColor lightGrayColor];
        _rightTitle.textAlignment = NSTextAlignmentRight;
    }
    return _rightTitle;
}

@end
