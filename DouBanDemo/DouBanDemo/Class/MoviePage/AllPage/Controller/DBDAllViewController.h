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

@interface DBDAllViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) DBDAllMovieView *allMovieView;
@property (nonatomic, strong) DBDAllOfHeadView *headView;
@property BOOL is_Refresh;

- (void)colorClickChange:(NSNotification *)noti;
- (void)clickAllBtn;
- (void)ImageFetch;
- (void)scrollFetch;

@end

NS_ASSUME_NONNULL_END
