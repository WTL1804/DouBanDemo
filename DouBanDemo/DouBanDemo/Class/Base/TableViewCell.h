//
//  TableViewCell.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDFirstCellScrollView.h"
#import "DBDAllMovieStarsButton.h"
NS_ASSUME_NONNULL_BEGIN
@protocol cellClickBtn <NSObject>

- (void)clickBtn;

@end

@interface TableViewCell : UITableViewCell


@property (nonatomic, strong) DBDFirstCellScrollView *zeroSectionScroll;
//movie
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *allBtn;

@property (nonatomic, strong) UIImageView *lineImage;
@property (nonatomic, strong) UIImageView *advertiseImageView;

@property (nonatomic, copy) NSString * leftString;
@property (nonatomic, copy) NSString * rightString;

//allMovie
@property (nonatomic, strong) UIImageView *leftImageViewOfAll;
@property (nonatomic, strong) UIImageView *splitImageView;

@property (nonatomic, strong) UILabel *leftTitleLabelOfAll;
@property (nonatomic, strong) UILabel *leftDescriptionLabelOfAll;

@property (nonatomic, strong) UIButton *buyButton;
@property (nonatomic, strong) DBDAllMovieStarsButton *starButton;


//剧照剧情简介tabview
@property (nonatomic, strong) UILabel *plotLabel;
@property (nonatomic, strong) UILabel *polotTitleLabel;
@property (nonatomic, strong) UILabel *previewLabel;

@property (nonatomic, strong) UIScrollView *scriptScroller;

@property (nonatomic, strong) UIButton *foldBtn;

@property (nonatomic, strong) UIImageView *scriptImageViewOne;
@property (nonatomic, strong) UIImageView *scriptImageViewtwo;
@property (nonatomic, strong) UIImageView *scriptImageViewthree;
@property (nonatomic, strong) UIImageView *scriptImageViewfour;

//短评tableView
@property (nonatomic, strong) UILabel *shortCommentLabel;
@property bool is_Fold;
@property (nonatomic, strong) UIButton *foldCommentButton;

//
@property (nonatomic, weak) id <cellClickBtn>cellDelegate;

- (void)colorChange:(UIButton *)btn;

- (void)allBtnClicked;
- (BOOL)changeStar:(DBDAllMovieStarsButton *)button Score:(NSString *)number;
@end

NS_ASSUME_NONNULL_END
