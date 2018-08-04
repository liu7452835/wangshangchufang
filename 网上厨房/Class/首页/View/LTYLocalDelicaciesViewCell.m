//
//  LTYLocalDelicaciesViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/4.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYLocalDelicaciesViewCell.h"

@implementation LTYLocalDelicaciesViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.snackView.layer.cornerRadius = 4;
        self.snackView.clipsToBounds = YES;
    }
    return self;
}

- (BaseView *)snackView{
    if (!_snackView) {
        _snackView = [[BaseView alloc] init];
        [self.contentView addSubview:_snackView];
        [_snackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.bottom.mas_equalTo(0);
        }];
    }
    return _snackView;
}

@end
