//
//  LTYSortModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseModel.h"

@class SortLists,SortLists_list;
@interface LTYSortModel : BaseModel

@property(nonatomic,assign) NSInteger hotest;

@property(nonatomic,assign) NSInteger verified;

@property(nonatomic,assign) NSInteger exclusive;

@property(nonatomic,assign) NSInteger videoImageId;

@property(nonatomic,assign) NSInteger state;

@property(nonatomic,assign) NSInteger latest;

@property(nonatomic,copy) NSString *message;

@property(nonatomic,strong) NSArray<SortLists *> *list;

@end


@interface SortLists: BaseModel

@property(nonatomic,copy) NSString *name;

@property(nonatomic,strong) NSArray<SortLists_list *> *list;

@end


@interface SortLists_list:BaseModel

@property(nonatomic,assign) NSInteger imageid;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) NSInteger ID;

@property(nonatomic,assign) BOOL isrec;

@end

