//
//  DBDAllViewController.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/19.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDAllMovieView.h"
#import "DBDAllOfHeadView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDAllViewController : UIViewController

@property (nonatomic, strong) DBDAllMovieView *allMovieView;
@property (nonatomic, strong) DBDAllOfHeadView *headView;


@end

NS_ASSUME_NONNULL_END
