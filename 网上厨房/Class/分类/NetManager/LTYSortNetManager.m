//
//  LTYSortNetManager.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYSortNetManager.h"
#import "LTYSortModel.h"

#define kSortURLPath @"https://api.ecook.cn/public/getRecipeHomeData.shtml"

@implementation LTYSortNetManager

+ (id)postSortPageCompletionHandle:(void (^)(id, NSError *))completed{
    return [self POST:kSortURLPath parameters:nil completionHandle:^(id responseObject, NSError *error) {
        completed([LTYSortModel mj_objectWithKeyValues:responseObject],error);
    }];
}

@end
