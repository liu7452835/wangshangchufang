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

@end

@implementation LTYTeachViewModel

- (void)getDataCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask =[LTYTeachNetManager postTeachTagCompletionHandle:^(id responseObject, NSError *error) {
        self.tagModel = responseObject;
        
        completed(error);
    }];
}

- (void)getMoreDateCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYTeachNetManager postTeachRecommendCompletionHandle:^(id responseObject, NSError *error) {
        self.recommendModel = responseObject;
        
        completed(error);
    }];
}

- (void)getTeachFreeDateCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYTeachNetManager postTeachFreeCompletionHandle:^(id responseObject, NSError *error) {
        self.freeTeachModel = responseObject;
        
        completed(error);
    }];
}

- (void)getTeachLatestAllCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYTeachNetManager postTeachLatestAllCompletionHandle:^(id responseObject, NSError *error) {
        self.latestAllModel = responseObject;
        completed(error);
    }];
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

- (LTYTeachRecommendModel *)freeTeachModel{
    if (!_freeTeachModel) {
        _freeTeachModel = [[LTYTeachRecommendModel alloc] init];
    }
    return _freeTeachModel;
}

- (LTYTeachRecommendModel *)latestAllModel{
    if (!_latestAllModel) {
        _latestAllModel = [LTYTeachRecommendModel new];
    }
    return _latestAllModel;
}

@end
