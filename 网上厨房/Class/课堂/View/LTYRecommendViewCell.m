//
//  LTYRecommendViewCell.m
//  网上厨房
//
//  Created by 刘天宇 on 2018/7/12.
//  Copyright © 2018年 刘天宇. All rights reserved.
//

#import "LTYRecommendViewCell.h"
#import "LTYRecommendView.h"

#define krecommendCount 8

@interface LTYRecommendViewCell()

@end


@implementation LTYRecommendViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setUpCellWithArray:(NSArray *)array{
    
    CGFloat xbase = 10;
    CGFloat width = (kScreenWidth - 30)/2;
    
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    
    self.scrollView.bounces = NO;
    
    for (int i = 0; i < 8; i++) {
        
        LTYRecommendView *recommendView = [[LTYRecommendView alloc] init];
        
        NSString *backgroudImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[i] valueForKey:@"himg"]];
        NSURL *backgroundURL = [NSURL URLWithString:backgroudImagePath];
        [recommendView.recommendBackgroundImageView setImageWithURL:backgroundURL placeholderImage:[UIImage imageNamed:@"service_close"]];
        //[recommendView.recommendBackgroundImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:backgroundURL]]];
        //NSLog(@"%@",backgroundURL);
        
        recommendView.title.text = [array[i] valueForKey:@"title"];
       // NSLog(@"%@",recommendView.title.text);
        
        NSString *idImagePath = [NSString stringWithFormat:@"https://pic.ecook.cn/web/%@.jpg!s4",[array[i] valueForKeyPath:@"teacher.imageid"]];
        NSURL *idIamgeURL = [NSURL URLWithString:idImagePath];
        [recommendView.idImageView setImageWithURL:idIamgeURL placeholderImage:[UIImage imageNamed:@"service_close"]];
        //[recommendView.idImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:idIamgeURL]]];
       // NSLog(@"%@",idIamgeURL);
        
        recommendView.nickName.text = [array[i] valueForKeyPath:@"teacher.nickname"];
        //NSLog(@"%@",recommendView.nickName.text);
        
        [recommendView.starImageView setImage:[UIImage imageNamed:[self convertStarNumber:[array[i] valueForKeyPath:@"teacher.star"]]]];
       // NSLog(@"%@",[self convertStarNumber:[array[i] valueForKeyPath:@"teacher.star"]]);
        
        [self.scrollView addSubview:recommendView];
      
        [recommendView setFrame:CGRectMake(xbase, 7, width, 300)];
        
        // NSLog(@"%f",xbase);
        
        xbase = xbase + 10 +width;
        
    }

    [self.scrollView setContentSize:CGSizeMake(xbase, self.scrollView.frame.size.height)];
    
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
