//
//  CommonViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/10.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "CommonViewCell.h"

@implementation CommonViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentShow3.hidden = NO;
    }
    return self;
}

-(CommonContentShow *)contentShow0{
    if (!_contentShow0) {
        _contentShow0 = [CommonContentShow new];
        [self.contentView addSubview:_contentShow0];
        [_contentShow0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.bottom.mas_equalTo(0);
        }];
    }
    return _contentShow0;
}

-(CommonContentShow *)contentShow1{
    if (!_contentShow1) {
        _contentShow1 = [CommonContentShow new];
        [self.contentView addSubview:_contentShow1];
        [_contentShow1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentShow0.mas_right).mas_equalTo(10);;
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(self.contentShow0);
        }];
    }
    return _contentShow1;
}

-(CommonContentShow *)contentShow2{
    if (!_contentShow2) {
        _contentShow2 = [CommonContentShow new];
        [self.contentView addSubview:_contentShow2];
        [_contentShow2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentShow1.mas_right).mas_equalTo(10);;
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(self.contentShow1);
        }];
    }
    return _contentShow2;
}

-(CommonContentShow *)contentShow3{
    if (!_contentShow3) {
        _contentShow3 = [CommonContentShow new];
        [self.contentView addSubview:_contentShow3];
        [_contentShow3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentShow2.mas_right).mas_equalTo(10);;
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(self.contentShow2);
            make.right.mas_equalTo(-10);
        }];
    }
    return _contentShow3;
}

@end
