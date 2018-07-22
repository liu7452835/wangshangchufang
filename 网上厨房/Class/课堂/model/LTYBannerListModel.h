//
//  LTYBannerListModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/22.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseModel.h"

@class BannerList_list;
@interface LTYBannerListModel : BaseModel

@property(nonatomic,strong) NSArray<BannerList_list *> *list;

@property(nonatomic,strong) NSString *state;

@property(nonatomic,strong) NSString *message;

@end

@interface BannerList_list : BaseModel

@property(nonatomic,strong) NSString *imageId;

@property(nonatomic,assign) NSInteger startTime;

@property(nonatomic,assign) NSInteger endTime;

@property(nonatomic,strong) NSString *url;

@end


