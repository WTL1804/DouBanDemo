//
//  MovieHeadView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol clickHeadBtn <NSObject>

- (void)clickBtn:(UIButton *)btn;

@end
@interface DBDMovieHeadView : UIView

@property (nonatomic, strong) UITextField *searchTextfield;

@property (nonatomic, strong) UIImageView *lineImage;
@property (nonatomic, strong) UIImageView *blackLineImageView;
//头部btn
@property (nonatomic, strong) UIButton *oneBtn;
@property (nonatomic, strong) UIButton *twoBtn;
@property (nonatomic, strong) UIButton *threeBtn;
@property (nonatomic, strong) UIButton *fourBtn;
@property (nonatomic, strong) UIButton *fiveBtn;
@property (nonatomic, strong) UIButton *sixBtn;

@property (nonatomic, strong) id<clickHeadBtn>delegate;

- (void)setUI;

- (void)colorChange:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
