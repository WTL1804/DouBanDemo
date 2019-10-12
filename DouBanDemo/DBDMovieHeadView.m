//
//  MovieHeadView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDMovieHeadView.h"
#import <Masonry.h>
@implementation DBDMovieHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];

    self.searchTextfield = [[UITextField alloc] init];
    self.searchTextfield.placeholder = @"     在你照片上画个小涂鸦";
    [self addSubview:self.searchTextfield];
    self.searchTextfield.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    self.searchTextfield.layer.cornerRadius = 15;
    self.searchTextfield.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    self.searchTextfield.leftView = [UIView new];
    
    
    self.whiteImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headBtn.png"]];
    [self addSubview:self.whiteImage];
    
    self.lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
    [self addSubview:self.lineImage];
    
    
}
- (void)layoutSubviews {
    [self.searchTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.frame.size.height * 1.5 / 5);
        make.bottom.equalTo(self.mas_bottom).offset(-self.frame.size.height * 3 / 7);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/20);
        make.right.equalTo(self.mas_right).offset(-self.frame.size.width/7);
    }];
    
    [self.lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-2);
        make.bottom.bottom.equalTo(self);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.whiteImage mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.searchTextfield.mas_bottom).offset(15);
           make.bottom.bottom.equalTo(self);
           make.left.equalTo(self.mas_left);
           make.right.equalTo(self.mas_right);
       }];
}

@end
