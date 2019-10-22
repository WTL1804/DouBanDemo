//
//  DBDMovieView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@protocol tableViewDelegate <NSObject>

- (void)clickCellButton;

@end

@interface DBDMovieView : UIView <UITableViewDelegate, UITableViewDataSource, cellClickBtn>


@property (nonatomic, strong) UITableView *overAlltableView;

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, weak) id <tableViewDelegate> tableViewDelegate;
- (void)setUI;

//- (void)colorChange:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
