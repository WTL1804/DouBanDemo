//
//  NavigationStarButton.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/13.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDNavigationStarButton.h"

@implementation DBDNavigationStarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)buttonWithType:(UIButtonType)buttonType {

    DBDNavigationStarButton *button = [super buttonWithType:buttonType];
    button.oneStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(31, 30, 8, 8)];
    [button addSubview:button.oneStarImageView];

    
    button.twoStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 30, 8, 8)];
    [button addSubview:button.twoStarImageView];
 
    
    button.threeStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(49, 30, 8, 8)];
    [button addSubview:button.threeStarImageView];

    
    button.fourStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(58, 30, 8, 8)];
    [button addSubview:button.fourStarImageView];

    
    button.fiveStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(67, 30, 8, 8)];
    [button addSubview:button.fiveStarImageView];

    button.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(68, 15, 8, 8)];
    button.scoreLabel.font = [UIFont systemFontOfSize:7];
    button.scoreLabel.textColor = [UIColor whiteColor];
    [button addSubview:button.scoreLabel];
    
    button.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(41, 15, 8, 8)];
    button.tempLabel.font = [UIFont systemFontOfSize:8];
    button.tempLabel.textColor = [UIColor grayColor];
    [button addSubview:button.tempLabel];
    
    return button;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(35, 0, 85, 40);
}
// 背景边界
- (CGRect)backgroundRectForBounds:(CGRect)bounds {
    return self.bounds;
}
//图片大小
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, 25, 40);
}
//内容边界
- (CGRect)contentRectForBounds:(CGRect)bounds {
    return self.bounds;
}

@end
