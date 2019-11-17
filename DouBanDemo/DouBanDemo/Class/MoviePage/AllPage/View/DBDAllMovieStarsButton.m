//
//  DBDAllMovieStarsButton.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/6.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDAllMovieStarsButton.h"

@implementation DBDAllMovieStarsButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)buttonWithType:(UIButtonType)buttonType {

    DBDAllMovieStarsButton *button = [super buttonWithType:buttonType];
    button.oneStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
    [button addSubview:button.oneStarImageView];

    
    button.twoStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 0, 13, 13)];
    [button addSubview:button.twoStarImageView];
 
    
    button.threeStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(28, 0, 13, 13)];
    [button addSubview:button.threeStarImageView];

    
    button.fourStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(41, 0, 13, 13)];
    [button addSubview:button.fourStarImageView];

    
    button.fiveStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(54, 0, 13, 13)];
    [button addSubview:button.fiveStarImageView];

    button.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(67, 0, 40, 16)];
    button.scoreLabel.textColor = [UIColor grayColor];
    [button addSubview:button.scoreLabel];
    
    button.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 60, 15)];
    button.tempLabel.font = [UIFont systemFontOfSize:12];
    button.tempLabel.textColor = [UIColor grayColor];
    [button addSubview:button.tempLabel];
    
    return button;
}
@end
