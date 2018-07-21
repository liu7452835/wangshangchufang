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
    
    [freeView.timeLabel setText: [array[itemRow] valueForKey:@"startTime"] ? [self timestampSwitchTime:[array[itemRow] valueForKey:@"startTime"]] : nil];
    //NSLog(@"%@",[array[itemRow] valueForKey:@"startTime"]);
    //[freeView.timeLabel setText:@"7月21日 周六 16:40开始"];
    
    [self.contentView addSubview:freeView];
    [freeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
   
}

- (NSString *)timestampSwitchTime:(NSNumber *)timestamp{
    
    //NSString *string = @"1532160000000,";
    NSInteger timestampNumber = [timestamp integerValue];
    NSTimeInterval second = timestampNumber / 1000.0;
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //NSLog(@"%@", date);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"M月dd日"];
    
    NSString *stringDate = [formatter stringFromDate:date];
    
    [formatter setDateFormat:@"HH:mm"];
    NSString *stringTime = [formatter stringFromDate:date];
    
    //NSLog(@"%@",stringDate);
    
    //NSLog(@"%@",stringTime);
    
    NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    NSInteger weekday = [components weekday];
    
    //NSLog(@"%ld",weekday);
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    //NSLog(@"%@",weekdays[weekday]);
    
    NSString *timeDate = [stringDate stringByAppendingFormat:@" %@ %@开始",weekdays[weekday],stringTime];
    
    //NSLog(@"%@",timeDate);
    
    return timeDate;
    
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
