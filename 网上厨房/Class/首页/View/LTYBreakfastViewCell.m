//
//  LTYBreakfastViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/1.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYBreakfastViewCell.h"

@implementation LTYBreakfastViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.baseView0.hidden = NO;
        self.baseView1.hidden = NO;
    }
    return self;
}


- (BaseView *)baseView0{
    if (!_baseView0) {
        _baseView0 = [[BaseView alloc] init];
        [self.contentView addSubview:_baseView0];
        [_baseView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((kScreenWidth - 30)/2, (kScreenWidth-30) /2));
            make.left.top.mas_equalTo(10);
        }];
    }
    return _baseView0;
}


- (BaseView *)baseView1{
    if (!_baseView1) {
        _baseView1 = [[BaseView alloc] init];
        [self.contentView addSubview:_baseView1];
        [_baseView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((kScreenWidth - 30)/2, (kScreenWidth-30) /2));
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.baseView0);
        }];
    }
    return _baseView1;
}

@end
