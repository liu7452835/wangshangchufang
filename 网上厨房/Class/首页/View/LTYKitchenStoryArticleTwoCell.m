//
//  LTYKitchenStoryArticleTwoCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYKitchenStoryArticleTwoCell.h"

@implementation LTYKitchenStoryArticleTwoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.kitchenStroyArticleTwo.hidden = NO;
    }
    return self;
}

- (LTYKitchenStoryArticleTwo *)kitchenStroyArticleTwo{
    if (!_kitchenStroyArticleTwo) {
        _kitchenStroyArticleTwo = [[LTYKitchenStoryArticleTwo alloc] init];
        [self.contentView addSubview:_kitchenStroyArticleTwo];
        [_kitchenStroyArticleTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _kitchenStroyArticleTwo;
}

@end
