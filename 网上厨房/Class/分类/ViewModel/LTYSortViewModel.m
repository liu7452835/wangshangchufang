//
//  LTYSortViewModel.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/9.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYSortViewModel.h"
#import "LTYSortNetManager.h"
#import "LTYSortModel.h"

@interface LTYSortViewModel()

@property(nonatomic,strong) LTYSortModel *model;
@property(nonatomic,strong) NSMutableArray *array;

@end

@implementation LTYSortViewModel


- (void)getDataCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [LTYSortNetManager postSortPageCompletionHandle:^(id responseObject, NSError *error) {
        self.model = responseObject;
        self.sortDetailArray = self.model.list;
        completed(error);
    }];
}

- (NSInteger)numberOfRowsForSection:(NSInteger)section{
    return ([[self.sortDetailArray[section] valueForKey:@"list"] count]- 1)/4 +1;
}

- (NSString *)detailTitleForSection:(NSInteger)section index:(NSInteger)index{
    return self.model.list[section].list[index].name;
}

- (NSString *)detailImageURLForSection:(NSInteger)section index:(NSInteger)index{
    NSInteger imageId = self.model.list[section].list[index].imageid;
    NSString *path = NSHomeDirectory();
    NSString *imagePath = [path stringByAppendingFormat:@"%ld.png",imageId];
    
   //NSURL *imagePath = [NSURL URLWithString:[NSString stringWithFormat: @"http://pic.ecook.cn/web/%ld.jpg!s4",imageId]];
    
    return imagePath;
}

#pragma mark - 懒加载

- (LTYSortModel *)model{
    if (!_model) {
        _model = [LTYSortModel new];
    }
    return _model;
}

- (NSInteger)sectionCount{
    if (!_sectionCount) {
        _sectionCount = [self.sortDetailArray count] + 2; // 加上固定的两个section
    }
    return _sectionCount;
}

- (void)tempImage{
        for (int i = 0; i< (self.sectionCount- 2); i++) {
            for (int j = 0; j< ([[self.sortDetailArray[i] valueForKey:@"list"] count]); j++) {
                NSString *path = NSHomeDirectory();
                NSInteger imageId = self.model.list[i].list[j].imageid;
                UIImage *image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://pic.ecook.cn/web/%ld.jpg!s4",imageId]]]];
                NSString *imagePath = [path stringByAppendingFormat:@"%ld.png",imageId];
                [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    
        }
    }
}

- (NSString *)titleForSection:(NSInteger)section{
    NSString *title = [[NSString alloc] init];
    title = self.model.list[section].name;
    return title;
}


@end
