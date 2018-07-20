//
//  LTYFreeViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/17.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYFreeViewCell.h"
#import "LTYFreeView.h"

@interface LTYFreeViewCell()

@property(nonatomic,strong) LTYFreeView *freeView;

@end


@implementation LTYFreeViewCell

- (void)setUpCellWithArray:(NSArray *)array withItemRow:(NSUInteger)itemRow{
    LTYFreeView *freeView = [[LTYFreeView alloc] init];
    
    if (freeView.title.text) {
        return;
    }
    
    NSString *backgroudImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[itemRow] valueForKey:@"himg"]];
    NSURL *backgroundURL = [NSURL URLWithString:backgroudImagePath];
    [freeView.recommendBackgroundImageView setImageWithURL:backgroundURL];
    //[recommendView.recommendBackgroundImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:backgroundURL]]];
    //NSLog(@"%@",backgroundURL);
    
    freeView.title.text = [array[itemRow] valueForKey:@"title"];
    // NSLog(@"%@",recommendView.title.text);
    
    NSString *idImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[itemRow] valueForKeyPath:@"teacher.imageid"]];
    NSURL *idIamgeURL = [NSURL URLWithString:idImagePath];
    [freeView.idImageView setImageWithURL:idIamgeURL];
    //[recommendView.idImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:idIamgeURL]]];
    // NSLog(@"%@",idIamgeURL);
    
    freeView.nickName.text = [array[itemRow] valueForKeyPath:@"teacher.nickname"];
    //NSLog(@"%@",recommendView.nickName.text);
    
    [freeView.starImageView setImage:[UIImage imageNamed:[self convertStarNumber:[array[itemRow] valueForKeyPath:@"teacher.star"]]]];
    // NSLog(@"%@",[self convertStarNumber:[array[i] valueForKeyPath:@"teacher.star"]]);
    
    [freeView.timeLabel setText:@"7月19日上午 4时 开始"];
    
    [self.contentView addSubview:freeView];
    [freeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
   
}


- (NSString *)convertStarNumber:(NSNumber *)starNum{
    switch ([starNum intValue]) {
        case 1:
            return @"talent_one_star";
            break;
            
        case 2:
            return @"talent_two_star";
            break;
        case 3:
            return @"talent_three_star";
            break;
            
        case 4:
            return @"talent_four_star";
            break;
            
        case 5:
            return @"talent_five_star";
            break;
            
        default:
            return @"white";
            break;
    }
}

@end
