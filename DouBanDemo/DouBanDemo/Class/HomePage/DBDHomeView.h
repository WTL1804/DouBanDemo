//
//  HomeView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBDHomeView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *mainScroll;


- (void)setUI;


@end

NS_ASSUME_NONNULL_END
