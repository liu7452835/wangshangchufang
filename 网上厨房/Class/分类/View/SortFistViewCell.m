//
//  SortFistViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "SortFistViewCell.h"

@interface SortFistViewCell()

@end

@implementation SortFistViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.accessoryType = UITableViewCellAccessoryNone;
        //self.imageView1.hidden = NO;
        
    };
    return self;
}

- (FirstViewShow *)firstViewShow{
    if (!_firstViewShow) {
        _firstViewShow = [[FirstViewShow alloc] init];
        [self.contentView addSubview:_firstViewShow];
        [_firstViewShow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
    }
    return _firstViewShow;
}

@end
