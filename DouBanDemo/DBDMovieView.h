//
//  DBDMovieView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBDMovieView : UIView <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView *overAlltableView;


- (void)setUI;

//- (void)colorChange:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
