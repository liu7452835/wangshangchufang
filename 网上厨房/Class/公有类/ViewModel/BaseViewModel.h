//
//  BaseViewModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelDelegate<NSObject>

@optional
/**获取更多*/
-(void)getMoreDateCompletionHandle:(void(^)(NSError *error))completed;

/**刷新*/
-(void)refreshDataCompletionHandle:(void(^)(NSError *error))completed;

/**获取数据*/
-(void)getDataCompletionHandle:(void(^)(NSError *error))completed;
/**获取多项数据*/
- (void)getMultipleDataCompletionHandle:(void (^)(NSError *error0,NSError *error1))completed;

@end


@interface BaseViewModel : NSObject<BaseViewModelDelegate>

@property(nonatomic,strong) NSURLSessionDataTask *dataTask;
@property(nonatomic,strong) NSURLSessionDataTask *dataTask1;
@property(nonatomic,strong) NSURLSessionDataTask *dataTask2;

//取消任务
-(void)cancelTask;
//暂停任务
-(void)suspendTask;
//继续任务
-(void)resumeTask;

@end
