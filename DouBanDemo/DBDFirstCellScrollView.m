//
//  firstCellScrollView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/11.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDFirstCellScrollView.h"
#import <Masonry.h>
@implementation DBDFirstCellScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.mutArray = [[NSMutableArray alloc] init];
    
    self.firstButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.firstButton.backgroundColor = [UIColor orangeColor];
    self.firstButton.layer.cornerRadius  = 5;
    self.firstButton.tag = 200;
    [self.firstButton setBackgroundImage:[UIImage imageNamed:@"123.JPG"] forState:UIControlStateNormal];
    [self addSubview:self.firstButton];
    [self.firstButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.secondButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.secondButton.backgroundColor = [UIColor orangeColor];
    self.secondButton.layer.cornerRadius  = 5;
    self.secondButton.tag = 201;
    [self addSubview:self.secondButton];
    [self.secondButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.thirdButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.thirdButton.backgroundColor = [UIColor orangeColor];
    self.thirdButton.tag = 202;
    self.thirdButton.layer.cornerRadius  = 5;
    [self addSubview:self.thirdButton];
    [self.thirdButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.fouthButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
   // self.fouthButton.backgroundColor = [UIColor orangeColor];
    self.fouthButton.tag = 203;
    self.fouthButton.layer.cornerRadius  = 5;
    [self addSubview:self.fouthButton];
    [self.fouthButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.fifthButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
   // self.fifthButton.backgroundColor = [UIColor orangeColor];
    self.fifthButton.layer.cornerRadius  = 5;
    self.fifthButton.tag = 204;
    [self addSubview:self.fifthButton];
    [self.fifthButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.sixthButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.sixthButton.backgroundColor = [UIColor orangeColor];
    self.sixthButton.layer.cornerRadius  = 5;
    self.sixthButton.tag = 205;
    [self addSubview:self.sixthButton];
    [self.sixthButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.oneButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
   // self.oneButton.backgroundColor = [UIColor orangeColor];
    self.oneButton.layer.cornerRadius  = 5;
    self.oneButton.tag = 206;
    [self addSubview:self.oneButton];
    [self.oneButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.twoButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.twoButton.backgroundColor = [UIColor orangeColor];
    self.twoButton.layer.cornerRadius  = 5;
    self.twoButton.tag = 207;
    [self addSubview:self.twoButton];
    [self.twoButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.threeButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
   // self.threeButton.backgroundColor = [UIColor orangeColor];
    self.threeButton.layer.cornerRadius  = 5;
    self.threeButton.tag = 208;
    [self addSubview:self.threeButton];
    [self.threeButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.fourButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.fourButton.backgroundColor = [UIColor orangeColor];
    self.fourButton.layer.cornerRadius  = 5;
    [self addSubview:self.fourButton];
    self.fourButton.tag = 209;
    [self.fourButton addSubview:self.fourButton.wantLabel];
    [self.fourButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.fiveButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.fiveButton.backgroundColor = [UIColor orangeColor];
    self.fiveButton.tag = 210;
    self.fiveButton.layer.cornerRadius  = 5;
    [self addSubview:self.fiveButton];
    [self.fiveButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];

    
    
    self.sixButton = [DBDBaseButton buttonWithType:UIButtonTypeCustom];
    //self.sixButton.backgroundColor = [UIColor orangeColor];
    self.sixButton.tag = 211;
    self.sixButton.layer.cornerRadius  = 5;
    [self addSubview:self.sixButton];
    [self.sixButton addTarget:self action:@selector(movieClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.firstButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height  * 1 / 2);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/48);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width * 15/96);
    }];
    [self.firstButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.firstButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.firstButton.mas_left);
        make.right.equalTo(self.firstButton.mas_right).offset(10);
    }];
    
    
    
    
    [self.secondButton mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.mas_top).offset(20);
           make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 1 / 2);
           make.left.equalTo(self.firstButton.mas_right).offset(self.frame.size.width/48);
           make.right.equalTo(self.firstButton.mas_right).offset(self.frame.size.width * 15/96);
       }];
    [self.secondButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.secondButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.secondButton.mas_left);
        make.right.equalTo(self.secondButton.mas_right).offset(10);
    }];
    
    
    [self.secondButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.secondButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.secondButton.mas_left);
        make.right.equalTo(self.secondButton.mas_right);
    }];
    
    [self.thirdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height *  1 / 2);
        make.left.equalTo(self.secondButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.secondButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    [self.thirdButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thirdButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.thirdButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.thirdButton.mas_left);
        make.right.equalTo(self.thirdButton.mas_right);
    }];
    
    [self.fouthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstButton.mas_bottom).offset(-10);
        make.bottom.equalTo(self.firstButton.mas_bottom).offset( self.frame.size.height * 1 / 2 - 30);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/48);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width * 15/96);
    }];
    [self.fouthButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fouthButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.fouthButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.fouthButton.mas_left);
        make.right.equalTo(self.fouthButton.mas_right);
    }];
    
    [self.fifthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstButton.mas_bottom).offset(-10);
        make.bottom.equalTo(self.firstButton.mas_bottom).offset( self.frame.size.height * 1 / 2 - 30);
        make.left.equalTo(self.fouthButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.fouthButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    
    [self.fifthButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fifthButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.fifthButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.fifthButton.mas_left);
        make.right.equalTo(self.fifthButton.mas_right);
    }];
    
    [self.sixthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstButton.mas_bottom).offset(-10);
        make.bottom.equalTo(self.firstButton.mas_bottom).offset( self.frame.size.height * 1 / 2 - 30);
        make.left.equalTo(self.fifthButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.fifthButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    
    [self.sixthButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sixthButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.sixthButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.sixthButton.mas_left);
        make.right.equalTo(self.sixthButton.mas_right);
    }];
    
    [self.oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height  * 1 / 2);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/48 + self.frame.size.width / 2);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width * 15/96 + self.frame.size.width / 2);
    }];
    [self.oneButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.oneButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.oneButton.mas_left);
        make.right.equalTo(self.oneButton.mas_right).offset(10);
    }];
    [self.oneButton.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneButton.mas_bottom).offset(-self.frame.size.height * 1 /15 + 12);
        make.bottom.equalTo(self.oneButton.mas_bottom);
        make.left.equalTo(self.oneButton.mas_left);
        make.right.equalTo(self.oneButton.mas_right).offset(-30);
    }];
    [self.oneButton.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneButton.mas_bottom).offset(-self.frame.size.height * 2 /15 + 20);
        make.bottom.equalTo(self.oneButton.dataLabel.mas_top);
        make.left.equalTo(self.oneButton.mas_left);
        make.right.equalTo(self.oneButton.mas_right).offset(-30);
    }];
    
    
    
//
    [self.twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 1 / 2);
        make.left.equalTo(self.oneButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.oneButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    [self.twoButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.twoButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.twoButton.mas_left);
        make.right.equalTo(self.twoButton.mas_right);
    }];
    [self.twoButton.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoButton.mas_bottom).offset(-self.frame.size.height * 1 /15 + 12);
        make.bottom.equalTo(self.twoButton.mas_bottom);
        make.left.equalTo(self.twoButton.mas_left);
        make.right.equalTo(self.twoButton.mas_right).offset(-30);
    }];
    [self.twoButton.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoButton.mas_bottom).offset(-self.frame.size.height * 2 /15 + 20);
        make.bottom.equalTo(self.twoButton.dataLabel.mas_top);
        make.left.equalTo(self.twoButton.mas_left);
        make.right.equalTo(self.twoButton.mas_right).offset(-30);
    }];
    
    
    [self.threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.bottom.equalTo(self.mas_top).offset(self.frame.size.height * 1 / 2);
        make.left.equalTo(self.twoButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.twoButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    [self.threeButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.threeButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.threeButton.mas_left);
        make.right.equalTo(self.threeButton.mas_right);
    }];
    [self.threeButton.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeButton.mas_bottom).offset(-self.frame.size.height * 1 /15 + 12);
        make.bottom.equalTo(self.threeButton.mas_bottom);
        make.left.equalTo(self.threeButton.mas_left);
        make.right.equalTo(self.threeButton.mas_right).offset(-30);
    }];
    [self.threeButton.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeButton.mas_bottom).offset(-self.frame.size.height * 2 /15 + 20);
        make.bottom.equalTo(self.threeButton.dataLabel.mas_top);
        make.left.equalTo(self.threeButton.mas_left);
        make.right.equalTo(self.threeButton.mas_right).offset(-30);
    }];
    
    
   [self.fourButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneButton.mas_bottom).offset(20);
        make.bottom.equalTo(self.oneButton.mas_bottom).offset( self.frame.size.height * 1 / 2);
        make.left.equalTo(self.mas_left).offset(self.frame.size.width/48 +  self.frame.size.width / 2);
        make.right.equalTo(self.mas_left).offset(self.frame.size.width * 15/96 + self.frame.size.width / 2);
    }];
    [self.fourButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fourButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.fourButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.fourButton.mas_left);
        make.right.equalTo(self.fourButton.mas_right);
    }];
    [self.fourButton.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fourButton.mas_bottom).offset(-self.frame.size.height * 1 /15 + 12);
        make.bottom.equalTo(self.fourButton.mas_bottom);
        make.left.equalTo(self.fourButton.mas_left);
        make.right.equalTo(self.fourButton.mas_right).offset(-30);
    }];
    [self.fourButton.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fourButton.mas_bottom).offset(-self.frame.size.height * 2 /15 + 20);
        make.bottom.equalTo(self.fourButton.dataLabel.mas_top);
        make.left.equalTo(self.fourButton.mas_left);
        make.right.equalTo(self.fourButton.mas_right).offset(-30);
    }];
    
    
    
    [self.fiveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneButton.mas_bottom).offset(20);
        make.bottom.equalTo(self.oneButton.mas_bottom).offset( self.frame.size.height * 1 / 2);
        make.left.equalTo(self.fourButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.fourButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    [self.fiveButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fiveButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.fiveButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.fiveButton.mas_left);
        make.right.equalTo(self.fiveButton.mas_right);
    }];
    [self.fiveButton.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fiveButton.mas_bottom).offset(-self.frame.size.height * 1 /15 + 12);
        make.bottom.equalTo(self.fiveButton.mas_bottom);
        make.left.equalTo(self.fiveButton.mas_left);
        make.right.equalTo(self.fiveButton.mas_right).offset(-30);
    }];
    [self.fiveButton.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fiveButton.mas_bottom).offset(-self.frame.size.height * 2 /15 + 20);
        make.bottom.equalTo(self.fiveButton.dataLabel.mas_top);
        make.left.equalTo(self.fiveButton.mas_left);
        make.right.equalTo(self.fiveButton.mas_right).offset(-30);
    }];
    
    
    [self.sixButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneButton.mas_bottom).offset(20);
        make.bottom.equalTo(self.oneButton.mas_bottom).offset( self.frame.size.height * 1 / 2);
        make.left.equalTo(self.fiveButton.mas_right).offset(self.frame.size.width/48);
        make.right.equalTo(self.fiveButton.mas_right).offset(self.frame.size.width * 15/96);
    }];
    [self.sixButton.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sixButton.mas_bottom).offset(-self.frame.size.height * 2 /15);
        make.bottom.equalTo(self.sixButton.mas_bottom).offset(-self.frame.size.height * 1 /15);
        make.left.equalTo(self.sixButton.mas_left);
        make.right.equalTo(self.sixButton.mas_right);
    }];
    [self.sixButton.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sixButton.mas_bottom).offset(-self.frame.size.height * 1 /15 + 12);
        make.bottom.equalTo(self.sixButton.mas_bottom);
        make.left.equalTo(self.sixButton.mas_left);
        make.right.equalTo(self.sixButton.mas_right).offset(-30);
    }];
    [self.sixButton.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sixButton.mas_bottom).offset(-self.frame.size.height * 2 /15 + 20);
        make.bottom.equalTo(self.sixButton.dataLabel.mas_top);
        make.left.equalTo(self.sixButton.mas_left);
        make.right.equalTo(self.sixButton.mas_right).offset(-30);
    }];
    
}
- (void)movieClick:(DBDBaseButton *)btn {
  
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clickBtn" object:btn];
    
}



@end
