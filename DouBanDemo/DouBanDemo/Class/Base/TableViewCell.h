//
//  TableViewCell.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDFirstCellScrollView.h"
NS_ASSUME_NONNULL_BEGIN
enum WTLTableViewCellStyle{

    UITableViewCellOfHomePage = 0,
    UITableViewCellOfMoviePageHead = 1,
    UITableViewCellOfMoviePageAll = 2,
};
@protocol cellClickBtn <NSObject>

- (void)clickBtn;

@end

@interface TableViewCell : UITableViewCell

@property (nonatomic,assign) enum WTLTableViewCellStyle cellStyleEnum;

@property (nonatomic, strong) DBDFirstCellScrollView *zeroSectionScroll;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *allBtn;

@property (nonatomic, strong) UIImageView *lineImage;
@property (nonatomic, strong) UIImageView *advertiseImageView;

@property (nonatomic, copy) NSString * leftString;
@property (nonatomic, copy) NSString * rightString;

@property (nonatomic, weak) id <cellClickBtn>cellDelegate;

- (void)colorChange:(UIButton *)btn;

- (void)allBtnClicked;

@end

NS_ASSUME_NONNULL_END
