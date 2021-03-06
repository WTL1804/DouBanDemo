//
//  DBDAllOfHeadView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/19.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBDAllOfHeadView : UIView

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *middleBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UIImageView *scorllLineImageView;

- (void)setUI;
- (void)colorChange:(UIButton *)btn;
@end

NS_ASSUME_NONNULL_END
