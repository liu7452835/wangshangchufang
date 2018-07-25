//
//  LTYTeachViewModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/26.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseViewModel.h"

@class LTYTeachTagModel;
@class LTYTeachRecommendModel;

@interface LTYTeachViewModel : BaseViewModel

@property(nonatomic,strong) LTYTeachTagModel *tagModel;
@property(nonatomic,strong) LTYTeachRecommendModel *recommendModel;
@property(nonatomic,strong) LTYTeachRecommendModel *freeTeachModel;
//@property(nonatomic,strong) LTYTeachRecommendModel *latestAllModel;
@property(nonatomic,strong) NSMutableArray<LTYTeachRecommendModel *> *teachListData;

@property(nonatomic,assign) NSInteger page;

- (void)getTeachFreeDateCompletionHandle:(void (^)(NSError *error))completed;

//- (void)getTeachLatestAllCompletionHandle:(void(^)(NSError *error))completed;

- (void)getMoreTeachLatestAllCompletionHandle:(void(^)(NSError *error))completed;

@end
