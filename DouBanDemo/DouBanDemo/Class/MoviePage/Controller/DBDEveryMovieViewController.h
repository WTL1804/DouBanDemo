//
//  DBDEveryMovieViewController.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDEveryMovieView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDEveryMovieViewController : UIViewController
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, strong) DBDEveryMovieView *mainView;

- (void)NetWork;
@end

NS_ASSUME_NONNULL_END
