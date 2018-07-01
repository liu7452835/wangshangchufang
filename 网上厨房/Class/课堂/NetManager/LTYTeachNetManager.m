//
//  LTYTeachNetManager.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/26.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYTeachNetManager.h"
#import "LTYTeachTagModel.h"
#import "LTYTeachRecommendModel.h"

#define kTeachTagURLPath @"https://api.ecook.cn/public/getOnlineTeachTags.shtml"
#define kTeachListURLPath @"https://api.ecook.cn/public/getOnlineTeachList.shtml"

#define kURLTerminal @"terminal":@"3"
#define kURLVersion @"version":@"13.9.3"
#define kURLLiveType @"type":@"live"
#define kURLRecommendType @"type":@"recommend"
#define kURLOrder @"order": @"latest"
#define kURLPage @"page":@"0"
#define kURLVideoType @"type":@"video"


@implementation LTYTeachNetManager

+(id)postTeachTagCompletionHandle:(void (^)(id, NSError *))completed{
    return [self POST:kTeachTagURLPath parameters:@{kURLTerminal,kURLVersion} completionHandle:^(id responseObject, NSError *error) {
        completed([LTYTeachTagModel mj_objectWithKeyValues:responseObject],error);
    }];
}

+(id)postTeachRecommendCompletionHandle:(void (^)(id, NSError *))completed{
    return [self POST:kTeachListURLPath parameters:@{kURLTerminal,kURLRecommendType,kURLVersion} completionHandle:^(id responseObject, NSError *error) {
        completed([LTYTeachRecommendModel mj_objectWithKeyValues:responseObject],error);
    }];
}

@end
