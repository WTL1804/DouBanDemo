//
//  HeadView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol clickBtn <NSObject>

- (void)clickButton:(UIButton *)btn;

@end
@interface DBDHeadView : UIView

@property (nonatomic, strong) UITextField *searchTextfield;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIImageView *greenImageView;

@property (nonatomic, strong) UIImageView *whiteImage;
@property (nonatomic, strong) UIImageView *lineImage;

@property (nonatomic, weak)id<clickBtn>delegate;

- (void)setUI;

- (void)colorChange:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
