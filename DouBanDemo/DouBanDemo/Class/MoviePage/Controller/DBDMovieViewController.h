//
//  DBDMovieViewController.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDMovieHeadView.h"
#import "DBDMovieView.h"
#import "TableViewCell.h"
#import "DBDFirstCellScrollView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDMovieViewController : UIViewController <clickHeadBtn, UIScrollViewDelegate, tableViewDelegate>

@property (nonatomic, strong) DBDMovieHeadView *headView;
@property (nonatomic, strong) DBDMovieView *movieView;
@property (nonatomic, copy) NSMutableArray *modelMutArray;


- (BOOL)changeStar:(DBDBaseButton *)button Score:(NSString *)number;
@end

NS_ASSUME_NONNULL_END
