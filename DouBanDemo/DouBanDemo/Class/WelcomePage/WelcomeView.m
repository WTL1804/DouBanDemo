//
//  WelcomeView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "WelcomeView.h"
#import <Masonry.h>
@implementation WelcomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) setUI {
    self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"douban.JPG"]];
    [self addSubview:self.logoImageView];
}
- (void)layoutSubviews {
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(self.frame.size.height * 6/7);
        make.bottom.equalTo(self.mas_bottom).offset(-self.frame.size.height/25);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
}
@end
