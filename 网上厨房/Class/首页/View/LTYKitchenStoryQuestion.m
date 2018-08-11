//
//  LTYKitchenStoryQuestion.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/8/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYKitchenStoryQuestion.h"

@interface LTYKitchenStoryQuestion()

@property(nonatomic,strong) UILabel *havePeopleQuestion;

@end

@implementation LTYKitchenStoryQuestion

- (instancetype)init{
    if (self = [super init]) {
        self.havePeopleQuestion.text = @"有人提问";
        self.question.font = [UIFont systemFontOfSize:15];
        self.reward.hidden = NO;
    }
    return self;
}

- (UILabel *)havePeopleQuestion{
    if (!_havePeopleQuestion) {
        _havePeopleQuestion = [[UILabel alloc] init];
        [self addSubview:_havePeopleQuestion];
        [_havePeopleQuestion mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(2);
            make.size.mas_equalTo(CGSizeMake(80, 25));
        }];
        _havePeopleQuestion.layer.cornerRadius =5;
        _havePeopleQuestion.clipsToBounds = YES;
        _havePeopleQuestion.layer.borderWidth =1;
        _havePeopleQuestion.layer.borderColor = [[UIColor orangeColor] CGColor];
        _havePeopleQuestion.textColor = [UIColor orangeColor];
        _havePeopleQuestion.textAlignment = NSTextAlignmentCenter;
        _havePeopleQuestion.font = [UIFont systemFontOfSize:15];
    }
    return _havePeopleQuestion;
}

- (UILabel *)question{
    if (!_question) {
        _question = [[UILabel alloc] init];
        [self addSubview:_question];
        [_question mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.havePeopleQuestion.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(0);
            make.topMargin.mas_equalTo(self.havePeopleQuestion.mas_topMargin).mas_equalTo(3);
        }];
        _question.numberOfLines = 2;
        _question.textColor = [UIColor blackColor];
        _question.textAlignment = NSTextAlignmentJustified;
    }
    return _question;
}


- (UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [UIImageView new];
        [self addSubview:_userImageView];
        [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            //make.bottom.mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(self.havePeopleQuestion.mas_bottom).mas_equalTo(10);
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
            make.centerY.mas_equalTo(self.userImageView.mas_centerY);
            make.width.mas_equalTo(kScreenWidth*2/5);
        }];
        _nickName.textColor = [UIColor grayColor];
        _nickName.textAlignment = NSTextAlignmentLeft;
        _nickName.font = [UIFont systemFontOfSize:12];
    }
    return _nickName;
}

- (UILabel *)answerCount{
    if (!_answerCount) {
        _answerCount = [[UILabel alloc] init];
        [self addSubview:_answerCount];
        [_answerCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(self.nickName.mas_centerY);
            make.width.mas_equalTo(60);
        }];
        _answerCount.textColor = [UIColor lightGrayColor];
        _answerCount.textAlignment = NSTextAlignmentRight;
        _answerCount.font = [UIFont systemFontOfSize:13];
    }
    return _answerCount;
}

- (UILabel *)reward{
    if (!_reward) {
        _reward = [UILabel new];
        [self addSubview:_reward];
        [_reward mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.answerCount.mas_left).mas_equalTo(-20);
            make.centerY.mas_equalTo(self.answerCount.mas_centerY);
            make.left.mas_equalTo(self.nickName.mas_right);
        }];
        _reward.textColor = [UIColor lightGrayColor];
        _reward.textAlignment = NSTextAlignmentRight;
        _reward.font = [UIFont systemFontOfSize:13];
    }
    return _reward;
}

@end
