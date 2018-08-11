//
//  LTYKitchenStoryQuestionCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/11.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYKitchenStoryQuestionCell.h"

@implementation LTYKitchenStoryQuestionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.kitchenStoryQuestion.hidden = NO;
    }
    return self;
}


- (LTYKitchenStoryQuestion *)kitchenStoryQuestion{
    if (!_kitchenStoryQuestion) {
        _kitchenStoryQuestion = [[LTYKitchenStoryQuestion alloc]init];
        [self.contentView addSubview:_kitchenStoryQuestion];
        [_kitchenStoryQuestion mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.bottom.right.mas_equalTo(-10);
        }];
    }
    return _kitchenStoryQuestion;
}

@end
