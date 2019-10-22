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
    
    self.blackLineImageView = [[UIImageView alloc] init];
    self.blackLineImageView.backgroundColor = [UIColor blackColor];
       [self addSubview:self.blackLineImageView];
       self.blackLineImageView.frame = CGRectMake(10, self.frame.size.height - 4, 40, 4);
    
    
    self.lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
    [self addSubview:self.lineImage];
    
    self.oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.oneBtn];
    [self.oneBtn setTitle:@"电影" forState:UIControlStateNormal];
    [self.oneBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.oneBtn.selected = YES;
    self.oneBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:0.1];
    [self.oneBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.oneBtn.tag = 300;
    
   
    self.twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.twoBtn];
    [self.twoBtn setTitle:@"电视" forState:UIControlStateNormal];
    [self.twoBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.twoBtn.selected = NO;
    self.twoBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:0.1];
     [self.twoBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.twoBtn.tag = 301;
    
    
    self.threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.threeBtn];
    [self.threeBtn setTitle:@"读书" forState:UIControlStateNormal];
    [self.threeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.threeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.threeBtn.selected = NO;
    self.threeBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:0.1];
     [self.threeBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.threeBtn.tag = 302;
    
    self.fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.fourBtn];
    [self.fourBtn setTitle:@"原创小说" forState:UIControlStateNormal];
    [self.fourBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.fourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.fourBtn.selected = NO;
    self.fourBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:0.1];
     [self.fourBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.fourBtn.tag = 303;
    
    
    self.fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.fiveBtn];
    [self.fiveBtn setTitle:@"音乐" forState:UIControlStateNormal];
    [self.fiveBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.fiveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.fiveBtn.selected = NO;
    self.fiveBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:0.1];
     [self.fiveBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.fiveBtn.tag = 304;
    
    
    self.sixBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.sixBtn];
    [self.sixBtn setTitle:@"同城" forState:UIControlStateNormal];
    [self.sixBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.sixBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.sixBtn.selected = NO;
    self.sixBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:0.1];
     [self.sixBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
    self.sixBtn.tag = 305;
    
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
        make.bottom.equalTo(self);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.oneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left).offset(-5);
        make.right.equalTo(self.mas_left).offset(55);
    }];
    
    [self.twoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.oneBtn.mas_right).offset(-5);
        make.right.equalTo(self.oneBtn.mas_right).offset(55);
    }];
    
    [self.threeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.twoBtn.mas_right).offset(-5);
        make.right.equalTo(self.twoBtn.mas_right).offset(55);
    }];
    
    [self.fourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.threeBtn.mas_right).offset(-5);
        make.right.equalTo(self.threeBtn.mas_right).offset(95);
    }];
    
    [self.fiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.fourBtn.mas_right).offset(-5);
        make.right.equalTo(self.fourBtn.mas_right).offset(55);
    }];
    
    [self.sixBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchTextfield.mas_bottom).offset(20);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.fiveBtn.mas_right).offset(-5);
        make.right.equalTo(self.fiveBtn.mas_right).offset(55);
    }];
}

- (void)colorChange:(UIButton *)btn {
    [self.delegate clickBtn:btn];

}

@end
