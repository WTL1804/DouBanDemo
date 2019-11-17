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
    [self.leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.leftBtn.selected = YES;
    [self.leftBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn.tag = 2000;
    
    self.middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.middleBtn];
    [self.middleBtn setTitle:@"即将上映" forState:UIControlStateNormal];
    [self.middleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.middleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self.middleBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.middleBtn.tag = 2001;
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setTitle:@"十月热映" forState:UIControlStateNormal];
    [self addSubview:self.rightBtn];
    [self.rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self.rightBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn.tag = 2002;
    
    _lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
    [self addSubview:_lineImageView];
    
    _scorllLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(32, 141, 72, 2)];
    [_scorllLineImageView setBackgroundColor:[UIColor blackColor]];
    [self addSubview:_scorllLineImageView];
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(100);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width/3);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];
    
    [self.middleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(100);
        make.left.equalTo(self.leftBtn.mas_right).offset(10);
        make.right.equalTo(self.leftBtn.mas_right).offset(self.frame.size.width/3);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(100);
        make.left.equalTo(self.middleBtn.mas_right).offset(10);
        make.right.equalTo(self.middleBtn.mas_right).offset(self.frame.size.width/3);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];

    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-2);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}
- (void)colorChange:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clickColorChange" object:btn];
}
@end
