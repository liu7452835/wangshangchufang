//
//  LTYSortViewModel.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "BaseViewModel.h"

@interface LTYSortViewModel : BaseViewModel

//http://m.ecook.cn/recipeDetail/id

@property(nonatomic,strong) NSArray *sortDetailArray;
@property(nonatomic,assign) NSInteger sectionCount;//总共的分区数


//分区对应的行数；
- (NSInteger)numberOfRowsForSection:(NSInteger)section;

//分区中各详细类对应的标题
- (NSString *) detailTitleForSection:(NSInteger)section index:(NSInteger)index;

//分区中各详细类对应的图片
- (NSString *) detailImageURLForSection:(NSInteger)section index:(NSInteger)index;

- (void)tempImage;//缓存图片

- (NSString *) titleForSection:(NSInteger)section;//分区的标题

@end
