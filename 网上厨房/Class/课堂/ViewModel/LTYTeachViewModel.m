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

- (NSString *)titleForTag:(NSInteger)index{
    
        return self.tagModel.data[index].title;
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
