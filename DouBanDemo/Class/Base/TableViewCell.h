//
//  TableViewCell.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "firstCellScrollView.h"
NS_ASSUME_NONNULL_BEGIN
enum WTLTableViewCellStyle{

    UITableViewCellOfHomePage = 0,
    UITableViewCellOfMoviePageHead = 1,
    UITableViewCellOfMoviePageAll = 2,
};

@interface TableViewCell : UITableViewCell

@property (nonatomic,assign) enum WTLTableViewCellStyle cellStyleEnum;

@property (nonatomic, strong) firstCellScrollView *zeroSectionScroll;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

- (void)colorChange:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
