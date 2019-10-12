//
//  MovieHeadView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBDMovieHeadView : UIView

@property (nonatomic, strong) UITextField *searchTextfield;

@property (nonatomic, strong) UIImageView *lineImage;
@property (nonatomic, strong) UIImageView *whiteImage;

- (void)setUI;

@end

NS_ASSUME_NONNULL_END
