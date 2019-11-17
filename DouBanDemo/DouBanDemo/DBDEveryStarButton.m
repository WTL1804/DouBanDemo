//
//  DBDEveryStarButton.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/10.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDEveryStarButton.h"

@implementation DBDEveryStarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)buttonWithType:(UIButtonType)buttonType {

    DBDEveryStarButton *button = [super buttonWithType:buttonType];
    button.oneStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 47, 13, 13)];
    [button addSubview:button.oneStarImageView];

    
    button.twoStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 47, 13, 13)];
    [button addSubview:button.twoStarImageView];
 
    
    button.threeStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(28, 47, 13, 13)];
    [button addSubview:button.threeStarImageView];

    
    button.fourStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(41, 47, 13, 13)];
    [button addSubview:button.fourStarImageView];

    
    button.fiveStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(54, 47, 13, 13)];
    [button addSubview:button.fiveStarImageView];

    button.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 47)];
    button.scoreLabel.font = [UIFont systemFontOfSize:24];
    button.scoreLabel.textColor = [UIColor whiteColor];
    [button addSubview:button.scoreLabel];
    
    button.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    button.tempLabel.font = [UIFont systemFontOfSize:12];
    button.tempLabel.textColor = [UIColor grayColor];
    [button addSubview:button.tempLabel];
    
    return button;
}

@end
