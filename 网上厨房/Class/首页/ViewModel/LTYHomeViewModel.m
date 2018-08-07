//
//  LTYHomeViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/29.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYHomeViewModel.h"
#import "LTYHomeModel.h"
#import "LTYHomeNetManager.h"

#define kBreakfast @"早餐"
#define khomeCook @"家常菜"
#define kPasta @"面食"
#define kDlicacies @"小吃"
#define kBake @"烘焙"

@interface LTYHomeViewModel()

@property(nonatomic,strong) LTYHomeModel *homeModel;

@end


@implementation LTYHomeViewModel


- (void)getDataCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYHomeNetManager postHomeDataCompletionHandle:^(id responseObject, NSError *error) {
        self.homeModel = responseObject;
        completed(error);
    }];
}

#pragma mark - 获取home页不同单元格对应的数据数组

- (NSArray *) dataArrayOfTitle:(NSString *) title{
    NSArray *dataArray = nil;
    for (int i = 0; i<self.homeModel.data.interests.count; i++) {
        if ([self.homeModel.data.interests[i].title containsString:title]) {
            dataArray = self.homeModel.data.interests[i].list;
            break;
        }
    }
    return dataArray;
}

/*
#pragma mark - 每个section的表头文字
- (NSString *)headViewTitleForIndex:(NSInteger)index{
    if (index == 0) {
        NSArray *array = [self.homeModel.data.interests[i].title
        return [array[index] valueForKeyPath:@"name"]
    } else{
        NSArray *array = [self dataArrayOfTitle:@"早餐"];
    }
}

*/

#pragma mark - 达人推荐视图中数据
//获得达人推荐视图中达人图片url地址
- (NSURL *)userInfoViewImageURLForIndex:(NSInteger)index{
    NSString *imageString = self.homeModel.data.users[index].imageid;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得达人推荐视图中达人名称
- (NSString *)userInfoViewUserTitleForIndex:(NSInteger)index{
    NSString *title = self.homeModel.data.users[index].title;
    return title;
}

//获得达人推荐视图中达人的标签
- (NSString *)userInfoViewUserTagForIndex:(NSInteger)index{
    NSMutableString *string = [[NSMutableString alloc] initWithString:@""];
    for (int i = 0; i<self.homeModel.data.users[index].specialities.count; i++) {
        [string appendFormat:@"%@ ",self.homeModel.data.users[index].specialities[i]];
    }
    return string;
}

#pragma mark - 烘培视图中数据
//获得烘培视图中背景图片url地址
- (NSURL *)bakeViewImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBake];
    NSString *imageString = [array[index] valueForKey:@"imageid"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得烘培视图中标题
- (NSString *)bakeViewTitleForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBake];
    NSString *breakfastTitle = [array[index] valueForKeyPath:@"name"];
    return breakfastTitle;
}

//获得烘培视图中作者图片url地址
- (NSURL *)bakeViewUserImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBake];
    NSString *imageString = [array[index] valueForKeyPath:@"user.imageid"];
    // NSLog(@"%@",imageString);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",imageString]];
    return url;
}

//获得烘培视图中作者名称
- (NSString *)bakeViewNickNameForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBake];
    NSString *nickName = [array[index] valueForKeyPath:@"user.nickname"];
    return nickName;
}

//获得烘培视图中星级图片
- (UIImage *)starImageOfBakesViewForIndex:(NSInteger)index{
    NSArray *starArray = @[@"white",@"talent_one_star",@"talent_two_star",@"talent_three_star",@"talent_four_star",@"talent_five_star"];
    NSArray *array = [self dataArrayOfTitle:kBake];
    NSNumber *starNumber = [array[index] valueForKeyPath:@"user.star"];
    return [UIImage imageNamed:starArray[starNumber.integerValue]];
}

#pragma mark - 风味小吃视图中数据

//获得风味小吃视图中背景图片url地址
- (NSURL *)delicaciesViewImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kDlicacies];
    NSString *imageString = [array[index] valueForKey:@"imageid"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得风味小吃视图中标题
- (NSString *)delicaciesViewTitleForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kDlicacies];
    NSString *breakfastTitle = [array[index] valueForKeyPath:@"name"];
    return breakfastTitle;
}

//获得风味小吃视图中作者图片url地址
- (NSURL *)delicaciesViewUserImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kDlicacies];
    NSString *imageString = [array[index] valueForKeyPath:@"user.imageid"];
    // NSLog(@"%@",imageString);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",imageString]];
    return url;
}

//获得风味小吃视图中作者名称
- (NSString *)delicaciesViewNickNameForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kDlicacies];
    NSString *nickName = [array[index] valueForKeyPath:@"user.nickname"];
    return nickName;
}

//获得风味小吃视图中星级图片
- (UIImage *)starImageOfDelicaciesViewForIndex:(NSInteger)index{
    NSArray *starArray = @[@"white",@"talent_one_star",@"talent_two_star",@"talent_three_star",@"talent_four_star",@"talent_five_star"];
    NSArray *array = [self dataArrayOfTitle:kDlicacies];
    NSNumber *starNumber = [array[index] valueForKeyPath:@"user.star"];
    return [UIImage imageNamed:starArray[starNumber.integerValue]];
}

#pragma mark - 面食视图中数据

//获得面食视图中背景图片url地址
- (NSURL *)pastaViewImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kPasta];
    NSString *imageString = [array[index] valueForKey:@"imageid"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得面食视图中标题
- (NSString *)pastaViewTitleForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kPasta];
    NSString *breakfastTitle = [array[index] valueForKeyPath:@"name"];
    return breakfastTitle;
}

//获得面食视图中作者图片url地址
- (NSURL *)pastaViewUserImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kPasta];
    NSString *imageString = [array[index] valueForKeyPath:@"user.imageid"];
    // NSLog(@"%@",imageString);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",imageString]];
    return url;
}

//获得面食视图中作者名称
- (NSString *)pastaViewNickNameForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kPasta];
    NSString *nickName = [array[index] valueForKeyPath:@"user.nickname"];
    return nickName;
}

//获得面食视图中星级图片
- (UIImage *)starImageOfPastaViewForIndex:(NSInteger)index{
    NSArray *starArray = @[@"white",@"talent_one_star",@"talent_two_star",@"talent_three_star",@"talent_four_star",@"talent_five_star"];
    NSArray *array = [self dataArrayOfTitle:kPasta];
    NSNumber *starNumber = [array[index] valueForKeyPath:@"user.star"];
    return [UIImage imageNamed:starArray[starNumber.integerValue]];
}

#pragma mark - 课程专辑视图中数据

//获得课程专辑视图中背景图片url地址
- (NSURL *)courseAlbumViewImageURLForIndex:(NSInteger)index{
    NSString *imageString = self.homeModel.data.teachalbums[index].vimg;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得课程专辑视图中共有几节课
- (NSString *)courseAlbumViewCourseCountsForIndex:(NSInteger)index{
    NSString *courseCounts = self.homeModel.data.teachalbums[index].teachNum;
    NSString *string = [NSString stringWithFormat:@"  共%@节课程  ",courseCounts];
    return string;
}

//获得课程专辑视图中标题
- (NSString *)courseAlbumViewTitleForIndex:(NSInteger)index{
    return self.homeModel.data.teachalbums[index].title;
}

#pragma mark - 线性滚动视图图片
//获得线性滚动视图中图片
- (NSURL *)linearScrollImageViewForIndex:(NSInteger)index{
    NSString *imageString = self.homeModel.data.banners[index].image;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

#pragma mark - 表的早餐视图数据

//获得早餐视图中背景图片url地址
- (NSURL *)breakfastViewBackgroundImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBreakfast];
    NSString *imageString = [array[index] valueForKey:@"imageid"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得早餐视图中标题
-(NSString *)breakfastTitleForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBreakfast];
    NSString *breakfastTitle = [array[index] valueForKeyPath:@"name"];
    return breakfastTitle;
}

//获得早餐视图中作者图片url地址
- (NSURL *)breakfastViewUserImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBreakfast];
    NSString *imageString = [array[index] valueForKeyPath:@"user.imageid"];
    // NSLog(@"%@",imageString);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",imageString]];
    return url;
}

//获得早餐视图中作者名称
- (NSString *)breakfastViewNickNameForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:kBreakfast];
    NSString *nickName = [array[index] valueForKeyPath:@"user.nickname"];
    return nickName;
}

//获得早餐视图中星级图片
- (UIImage *)starImageOfBreakfastViewForIndex:(NSInteger)index{
    NSArray *starArray = @[@"white",@"talent_one_star",@"talent_two_star",@"talent_three_star",@"talent_four_star",@"talent_five_star"];
    NSArray *array = [self dataArrayOfTitle:kBreakfast];
    NSNumber *starNumber = [array[index] valueForKeyPath:@"user.star"];
    return [UIImage imageNamed:starArray[starNumber.integerValue]];
}

#pragma mark - 表的滚动视图数据

//获得滚动视图中背景图片url地址
- (NSURL *)scrollViewImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:khomeCook];
    NSString *imageString = [array[index] valueForKey:@"imageid"];
   // NSLog(@"%@",imageString);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",imageString]];
    return url;
}

//获得滚动视图中作者图片url地址
- (NSURL *)scrollViewUserImageURLForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:khomeCook];
    NSString *imageString = [array[index] valueForKeyPath:@"user.imageid"];
    // NSLog(@"%@",imageString);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",imageString]];
    return url;
}
//获得滚动视图中作者名称
- (NSString *)nickNameForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:khomeCook];
    NSString *nickName = [array[index] valueForKeyPath:@"user.nickname"];
    
    return nickName;
}

//获得滚动视图中星级图片
- (UIImage *)starImageForIndex:(NSInteger)index{
     NSArray *starArray = @[@"white",@"talent_one_star",@"talent_two_star",@"talent_three_star",@"talent_four_star",@"talent_five_star"];
    NSArray *array = [self dataArrayOfTitle:khomeCook];
    NSNumber *starNumber = [array[index] valueForKeyPath:@"user.star"];
    return [UIImage imageNamed:starArray[starNumber.integerValue]];
}

//获得滚动视图中标题
- (NSString *)cookTitleForIndex:(NSInteger)index{
    NSArray *array = [self dataArrayOfTitle:khomeCook];
    NSString *cookTitle = [array[index] valueForKeyPath:@"name"];
    return cookTitle;
}

#pragma mark - 表的头视图数据
//获得表头视图中标签文字
- (NSString *)headViewTagLabelForIndex:(NSInteger)index{
    NSString *string = nil;
    string = self.homeModel.data.items[index].title;
    
    return string;
}

//获得表头视图中图片url地址
-(NSURL *)headViewTagImageViewForIndex:(NSInteger)index{
    NSURL *url = nil;
    NSString *string = self.homeModel.data.items[index].imageid;
    url = [NSURL URLWithString:[NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg",string]];
    
    return url;
}

#pragma mark - lazy Load

- (LTYHomeModel *)homeModel{
    if (!_homeModel) {
        _homeModel = [[LTYHomeModel alloc] init];
    }
    return _homeModel;
}

- (NSInteger)tagCount{
    _tagCount = self.homeModel.data.items.count;
    return _tagCount;
    
}

- (NSInteger)numberOfItemsInScrollView{
    NSArray *array = [self dataArrayOfTitle:khomeCook];
    _numberOfItemsInScrollView = array.count;
    return _numberOfItemsInScrollView;
}

- (NSInteger)numberOfItemsInLinerScrollView{
    return self.homeModel.data.banners.count;
}


- (NSInteger)numberOfItemsInCourseView{
    return self.homeModel.data.teachalbums.count;
}

- (NSInteger)numberOfItemsInPastaView{
    NSArray *array = [self dataArrayOfTitle:kPasta];
    _numberOfItemsInPastaView = array.count;
    return _numberOfItemsInPastaView;
}

- (NSInteger)numberOfItemsInBakeView{
    NSArray *array = [self dataArrayOfTitle:kBake];
    _numberOfItemsInPastaView = array.count;
    return _numberOfItemsInPastaView;
}

- (NSInteger)numberOfUsers{
    return self.homeModel.data.users.count;
}

@end
