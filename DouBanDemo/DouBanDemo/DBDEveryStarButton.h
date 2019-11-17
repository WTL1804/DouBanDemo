//
//  DBDEveryStarButton.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/10.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBDEveryStarButton : UIButton

@property (nonatomic, strong) UIImageView *oneStarImageView;
@property (nonatomic, strong) UIImageView *twoStarImageView;
@property (nonatomic, strong) UIImageView *threeStarImageView;
@property (nonatomic, strong) UIImageView *fourStarImageView;
@property (nonatomic, strong) UIImageView *fiveStarImageView;

@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *tempLabel;

@end

NS_ASSUME_NONNULL_END
