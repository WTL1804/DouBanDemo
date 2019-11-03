//
//  DBDBaseButton.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/11.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDBaseButton.h"

@implementation DBDBaseButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    
    DBDBaseButton *button = [super buttonWithType:buttonType];
    button.dataLabel = [[UILabel alloc] init];
    button.dataLabel.font = [UIFont systemFontOfSize:12];
     button.dataLabel.layer.borderWidth = 1.5;
     button.dataLabel.layer.borderColor = [UIColor redColor].CGColor;
     button.dataLabel.textColor = [UIColor redColor];
     button.dataLabel.textAlignment = NSTextAlignmentCenter;
    [button addSubview:button.dataLabel];
    button.label = [[UILabel alloc] init];
      [button addSubview:button.label];
      button.label.font = [UIFont systemFontOfSize:12];
    button.wantLabel = [[UILabel alloc] init];
    [button addSubview:button.wantLabel];
    button.wantLabel.font = [UIFont systemFontOfSize:11.5];
    button.wantLabel.textColor = [UIColor grayColor];
    
    
    button.oneStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 183, 13, 13)];
    [button addSubview:button.oneStarImageView];
    button.oneStarImageView.tag = 300;
    
    button.twoStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 183, 13, 13)];
    [button addSubview:button.twoStarImageView];
    button.twoStarImageView.tag = 310;
    
    button.threeStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(28, 183, 13, 13)];
    [button addSubview:button.threeStarImageView];
    button.threeStarImageView.tag = 320;
    
    button.fourStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(41, 183, 13, 13)];
    [button addSubview:button.fourStarImageView];
    button.fourStarImageView.tag = 330;
    
    button.fiveStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(54, 183, 13, 13)];
    [button addSubview:button.fiveStarImageView];
    button.fiveStarImageView.tag = 340;
    
    button.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(67, 183, 40, 16)];
    button.scoreLabel.textColor = [UIColor grayColor];
    [button addSubview:button.scoreLabel];
    
    button.tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 183, 60, 20)];
    button.tempLabel.font = [UIFont systemFontOfSize:12];
    button.tempLabel.textColor = [UIColor grayColor];
    [button addSubview:button.tempLabel];
    button.userInteractionEnabled = YES;
    button.imageView.userInteractionEnabled = YES;
    
    return button;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
    [self.imageView addSubview:self.label];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:5];
    return self;
}

//返回标题view的大小
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, self.bounds.size.height * 3 / 4 + 10, self.bounds.size.width, self.bounds.size.height / 4);
}
// 背景边界
- (CGRect)backgroundRectForBounds:(CGRect)bounds {
    return CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height -30 - 30);
}
//图片大小
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 3/4);
}
//内容边界
- (CGRect)contentRectForBounds:(CGRect)bounds {
    return CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height + 10);
}
@end
