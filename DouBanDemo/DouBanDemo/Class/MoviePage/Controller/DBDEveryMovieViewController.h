//
//  DBDEveryMovieViewController.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDEveryMovieView.h"
#import <SOZOChromoplast.h>
#import "DBDNavigationStarButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDEveryMovieViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, strong) DBDEveryMovieView *mainView;
@property (nonatomic, strong) UIBarButtonItem *item3;
@property (nonatomic, strong) UIBarButtonItem *itemImageBtn;
- (void)NetWork;

- (BOOL)changeStar:(DBDEveryStarButton *)button Score:(NSString *)number;
@property (nonatomic, strong) NSMutableArray *colorMutArray;
@property (nonatomic, strong) NSMutableArray *percentMutArray;
@property (nonatomic, strong) DBDNavigationStarButton *navigationStarBtn;
@end
NS_ASSUME_NONNULL_END
