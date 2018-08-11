//
//  LTYKitchenStoryArticleOneCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYKitchenStoryArticleOneCell.h"

@implementation LTYKitchenStoryArticleOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.kitchenStoryArticleOne.hidden = NO;
    }
    return self;
}

- (LTYKitchenStoryArticleOne *)kitchenStoryArticleOne{
    if (!_kitchenStoryArticleOne) {
        _kitchenStoryArticleOne = [[LTYKitchenStoryArticleOne alloc] init];
        [self.contentView addSubview:_kitchenStoryArticleOne];
        [_kitchenStoryArticleOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _kitchenStoryArticleOne;
}

@end
