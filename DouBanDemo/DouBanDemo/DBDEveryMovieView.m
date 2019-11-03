//
//  DBDEveryMovieView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDEveryMovieView.h"

@implementation DBDEveryMovieView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _titleLabel.backgroundColor = [UIColor grayColor];
    _titleLabel.textColor = [UIColor redColor];
    [self addSubview:_titleLabel];
}

@end
