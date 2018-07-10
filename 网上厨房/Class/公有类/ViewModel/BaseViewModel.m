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
}

- (void)resumeTask{
    [self.dataTask resume];
}

- (void)suspendTask{
    [self.dataTask suspend];
}

@end
