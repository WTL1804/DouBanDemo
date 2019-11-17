//
//  AllMovieView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/19.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDAllMovieView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *mainScroll;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *middleTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) TableViewCell *leftCell;
@property (nonatomic, strong) TableViewCell *rightCell;
@property (nonatomic, strong) TableViewCell *middleCell;

@property (nonatomic, strong) NSMutableArray *urlMutArray;
@property (nonatomic, strong) NSMutableArray *titleMutArray;
@property (nonatomic, strong) NSMutableArray *descriptionMutArray;
@property (nonatomic, strong) NSMutableArray *scoreMutArray;
@property (nonatomic, strong) NSMutableArray *starMutArray;
@property (nonatomic, strong) NSMutableArray *buyMutArray;
@property (nonatomic, strong) NSMutableArray *IDMutArray;

- (void)setUI;

@end

NS_ASSUME_NONNULL_END
