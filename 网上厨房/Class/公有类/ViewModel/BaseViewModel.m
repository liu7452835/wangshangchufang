//
//  BaseViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cancelTask{
    [self.dataTask cancel];
    [self.dataTask1 cancel];
    [self.dataTask2 cancel];
}

- (void)resumeTask{
    [self.dataTask resume];
    [self.dataTask1 resume];
    [self.dataTask2 resume];
}

- (void)suspendTask{
    [self.dataTask suspend];
    [self.dataTask1 suspend];
    [self.dataTask2 suspend];
}

@end
