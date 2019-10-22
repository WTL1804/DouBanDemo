//
//  DBDAllOfHeadView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/19.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDAllOfHeadView.h"
#import <Masonry.h>
@implementation DBDAllOfHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI{
    self.backgroundColor = [UIColor whiteColor];

    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.leftBtn];
    [self.leftBtn setTitle:@"正在热映" forState:UIControlStateNormal];
//    [self.leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
    self.middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.middleBtn];
    [self.middleBtn setTitle:@"即将上映" forState:UIControlStateNormal];
    [self.middleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.middleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setTitle:@"十月热映" forState:UIControlStateNormal];
    [self addSubview:self.rightBtn];
    [self.rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(35);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/3);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
}

@end
