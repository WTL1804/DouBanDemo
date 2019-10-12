//
//  firstCellScrollView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/11.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "firstCellScrollView.h"
#import <Masonry.h>
@implementation firstCellScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.firstButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    self.firstButton.backgroundColor = [UIColor orangeColor];
    self.firstButton.layer.cornerRadius  = 5;
    [self addSubview:self.firstButton];
    
    self.secondButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    self.secondButton.backgroundColor = [UIColor orangeColor];
    self.secondButton.layer.cornerRadius  = 5;
    [self addSubview:self.secondButton];
    
    self.thirdButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    self.thirdButton.backgroundColor = [UIColor orangeColor];
    self.thirdButton.layer.cornerRadius  = 5;
    [self addSubview:self.thirdButton];
    
    self.fouthButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    self.fouthButton.backgroundColor = [UIColor orangeColor];
    self.fouthButton.layer.cornerRadius  = 5;
    [self addSubview:self.fouthButton];
    
    self.fifthButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    self.fifthButton.backgroundColor = [UIColor orangeColor];
    self.fifthButton.layer.cornerRadius  = 5;
    [self addSubview:self.fifthButton];
    
    self.sixthButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    self.sixthButton.backgroundColor = [UIColor orangeColor];
    self.sixthButton.layer.cornerRadius  = 5;
    [self addSubview:self.sixthButton];
    
    
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.firstButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height  * 7 / 16);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/48);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width * 15/96);
    }];
    
    [self.secondButton mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.mas_top).offset(10);
           make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 7 / 16);
           make.left.equalTo(self.firstButton.mas_right).offset(self.frame.size.width/48);
           make.right.equalTo(self.firstButton.mas_right).offset(self.frame.size.width * 15/96);
       }];
    
    [self.thirdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height *  7 / 16);
        make.left.equalTo(self.secondButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.secondButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    
    
    [self.fouthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstButton.mas_bottom).offset(15);
        make.bottom.equalTo(self.firstButton.mas_bottom).offset( self.frame.size.height * 7 / 16);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/48);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width * 15/96);
    }];
    
    [self.fifthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstButton.mas_bottom).offset(15);
        make.bottom.equalTo(self.firstButton.mas_bottom).offset( self.frame.size.height * 7 / 16);
        make.left.equalTo(self.fouthButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.fouthButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    
    [self.sixthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstButton.mas_bottom).offset(15);
        make.bottom.equalTo(self.firstButton.mas_bottom).offset( self.frame.size.height * 7 / 16);
        make.left.equalTo(self.fifthButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.fifthButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    
    
}


@end
