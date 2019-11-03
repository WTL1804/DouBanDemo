//
//  DBDBaseButton.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/11.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN


@interface DBDBaseButton : UIButton
@property (nonatomic, strong) UILabel *label;
//@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) UILabel *wantLabel;

@property (nonatomic, strong) UIImageView *oneStarImageView;
@property (nonatomic, strong) UIImageView *twoStarImageView;
@property (nonatomic, strong) UIImageView *threeStarImageView;
@property (nonatomic, strong) UIImageView *fourStarImageView;
@property (nonatomic, strong) UIImageView *fiveStarImageView;

@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *tempLabel;

@property (nonatomic, strong) NSString *ID;
@end

NS_ASSUME_NONNULL_END
