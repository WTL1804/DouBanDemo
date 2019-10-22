//
//  WelComeViewController.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WelcomeView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WelComeViewController : UIViewController

@property int number;

@property (nonatomic, strong) WelcomeView *welcomeView;

@property NSTimer *advertiseTimer;

- (void)Timer;

@end

NS_ASSUME_NONNULL_END
