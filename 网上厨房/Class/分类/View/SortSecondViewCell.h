//
//  SortSecondViewCell.h
//  网上厨房
//
//  Created by 刘天宇 on 2018/6/10.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendContentShow.h"

@interface SortSecondViewCell : UITableViewCell
@property(nonatomic,strong) RecommendContentShow *hotMenu;
@property(nonatomic,strong) RecommendContentShow *latestMenu;
@end
