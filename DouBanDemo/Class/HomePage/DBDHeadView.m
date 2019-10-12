//
//  HeadView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDHeadView.h"
#import <Masonry.h>

@implementation DBDHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor colorWithRed:0.4039 green:0.72941176 blue:0.38431373 alpha:1];
    
    self.searchTextfield = [[UITextField alloc] init];
    self.searchTextfield.placeholder = @"     在你照片上画个小涂鸦";
    [self addSubview:self.searchTextfield];
    self.searchTextfield.backgroundColor = [UIColor whiteColor];
    self.searchTextfield.layer.cornerRadius = 15;
    self.searchTextfield.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    self.searchTextfield.leftView = [UIView new];
    
    
    self.whiteImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"white.png"]];
    [self addSubview:self.whiteImage];
    
    self.lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
    [self addSubview:self.lineImage];
    
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.leftButton];
    [self.leftButton setTitle:@"动态" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    [self.leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.leftButton.tag = 122;
     [self.leftButton addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.leftButton.selected = YES;
    
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.rightButton];
    [self.rightButton setTitle:@"推荐" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
    [self.rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.rightButton.tag = 120;
    self.rightButton.selected = NO;
    
    
    
}
- (void)layoutSubviews {
    [self.searchTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.frame.size.height * 1.5 / 5);
        make.bottom.equalTo(self.mas_bottom).offset(-self.frame.size.height * 3 / 7);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/20);
        make.right.equalTo(self.mas_right).offset(-self.frame.size.width/7);
    }];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/2 - 50);
        make.right.equalTo(self.mas_right).offset(-self.frame.size.width/2);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self);
        make.left.equalTo(self.leftButton.mas_right);
        make.right.equalTo(self.leftButton.mas_right).offset(50);
    }] ;
    
    [self.whiteImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(5);
        make.bottom.bottom.equalTo(self);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.mas_bottom).offset(-1);
           make.bottom.bottom.equalTo(self);
           make.left.equalTo(self.mas_left);
           make.right.equalTo(self.mas_right);
       }];
}

- (void)colorChange:(UIButton *)btn {
    
    if (btn.tag == 120) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.leftButton.selected = NO;
        } else if (btn.selected == YES) {
            btn.selected = NO;
            self.leftButton.selected = YES;
        }
    } else if (btn.tag == 122) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.rightButton.selected = NO;
        } else if (btn.selected == YES) {
            btn.selected = NO;
            self.rightButton.selected = YES;
        }
    }
    //NSLog(@"%d %d",self.leftButton.selected,self.rightButton.selected);
}
@end
