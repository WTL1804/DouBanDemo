//
//  DBDHomePageViewController.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDHomeView.h"
#import "DBDHeadView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDHomePageViewController : UIViewController <clickBtn, UIScrollViewDelegate>
@property (nonatomic, strong) DBDHomeView *homeView;
@property (nonatomic, strong) DBDHeadView *headView;
@property (nonatomic, strong) NSMutableArray *allMovieModelArray;
@end

NS_ASSUME_NONNULL_END
