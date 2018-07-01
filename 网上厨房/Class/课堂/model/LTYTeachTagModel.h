//
//  LTYTeachModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/25.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseModel.h"

@class TeachModel_data,Data_list;

@interface LTYTeachTagModel : BaseModel

@property(nonatomic,strong) NSArray<TeachModel_data *> *data;

@property(nonatomic,strong) NSString *state;

@property(nonatomic,strong) NSString *message;

@end

@interface TeachModel_data : BaseModel

@property(nonatomic,strong) NSString *imageid;

@property(nonatomic,strong) NSString *title;

@property(nonatomic,strong) NSArray<Data_list *> *list;

@end

@interface Data_list : BaseModel

@property(nonatomic,strong) NSString *title;

@end

