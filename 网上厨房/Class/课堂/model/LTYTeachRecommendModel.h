//
//  LTYTeachRecommendModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/25.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseModel.h"

@class LTYTeachRecommend_List,LTYTeachRecommend_Teacher;

@interface LTYTeachRecommendModel : BaseModel

@property(nonatomic,strong) NSArray<LTYTeachRecommend_List *> *list;

@property(nonatomic,strong) NSString *state;

@property(nonatomic,strong) NSString *message;

@end

@interface LTYTeachRecommend_List :BaseModel

@property(nonatomic,assign) NSInteger learnedNum;

@property(nonatomic,assign) NSInteger ecookCoin;

@property(nonatomic,strong) NSString *himg;

@property(nonatomic,strong) NSString *title;

@property(nonatomic,strong) NSString *score;

@property(nonatomic,strong) NSString *pushUrl;

@property(nonatomic,strong) LTYTeachRecommend_Teacher *teacher;

@property(nonatomic,assign) NSInteger price;

@property(nonatomic,assign) NSUInteger startTime;

@property(nonatomic,strong) NSString *vimg;

@property(nonatomic,assign) NSUInteger endTime;

@property(nonatomic,assign) NSInteger ID;

@property(nonatomic,strong) NSString *cny;

@property(nonatomic,assign) NSInteger status;

@end

@interface LTYTeachRecommend_Teacher : BaseModel

@property(nonatomic,strong) NSString *imageid;

@property(nonatomic,assign) NSInteger star;

@property(nonatomic,strong) NSString *profile;

@property(nonatomic,strong) NSString *nickname;

@property(nonatomic,assign) NSInteger SIGNED;

@property(nonatomic,strong) NSString *ID;

@property(nonatomic,strong) NSString *Rookie;

@end

