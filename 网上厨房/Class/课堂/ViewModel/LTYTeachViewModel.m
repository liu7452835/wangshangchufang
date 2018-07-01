//
//  LTYTeachViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/26.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTeachViewModel.h"
#import "LTYTeachTagModel.h"
#import "LTYTeachNetManager.h"
#import "LTYTeachRecommendModel.h"

@interface LTYTeachViewModel()

@property(nonatomic,strong) LTYTeachTagModel *tagModel;
@property(nonatomic,strong) LTYTeachRecommendModel *recommendModel;

@end

@implementation LTYTeachViewModel

- (void) getMultipleDataCompletionHandle:(void (^)(NSError *,NSError *))completed{
    __block NSError *error0,*error1;
    self.dataTask =[LTYTeachNetManager postTeachTagCompletionHandle:^(id responseObject, NSError *error) {
        self.tagModel = responseObject;
        error0 = error;
    }];

    self.dataTask1 = [LTYTeachNetManager postTeachRecommendCompletionHandle:^(id responseObject, NSError *error) {
        self.recommendModel = responseObject;
        error1 = error;
        //completed(error);
    }];
    completed(error0,error1);
}


#pragma mark - 懒加载

- (LTYTeachTagModel *)tagModel{
    if (!_tagModel) {
        _tagModel = [[LTYTeachTagModel alloc] init];
    }
    return _tagModel;
}

- (LTYTeachRecommendModel *)recommendModel{
    if (!_recommendModel) {
        _recommendModel = [[LTYTeachRecommendModel alloc] init];
    }
    return _recommendModel;
}

@end
