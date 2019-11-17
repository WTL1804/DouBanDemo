//
//  DBDEveryMovieView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDEveryStarButton.h"
#import "TableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDEveryMovieView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *originalTitleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, strong) UIImageView *movieImageView;

@property (nonatomic, strong) UIScrollView *mainScroll;


@property (nonatomic, strong) UIButton *wantLookBtn;
@property (nonatomic, strong) UIButton *LookedBtn;
@property (nonatomic, strong) UIImageView *backgroundImage;

//backiamge
@property (nonatomic, strong) UILabel *markLabel;
@property (nonatomic, strong) DBDEveryStarButton *starButton;
@property (nonatomic, strong) UIImageView *lineImage;
@property (nonatomic, strong) UILabel *peopleLabel;
@property (nonatomic, strong) UILabel *peopleHasScoreLabel;
@property (nonatomic, strong) NSMutableArray *progressMutArray;
@property (nonatomic, strong) UIProgressView *progressViewFive;
@property (nonatomic, strong) UIProgressView *progressViewFour;
@property (nonatomic, strong) UIProgressView *progressViewThree;
@property (nonatomic, strong) UIProgressView *progressViewTwo;
@property (nonatomic, strong) UIProgressView *progressViewOne;
//尚未上映
@property (nonatomic, strong) UILabel *noViewLabel;
@property (nonatomic, strong) UILabel *wantLabel;
//剧情简介和剧照
@property (nonatomic, strong) UITableView *scriptTableView;
@property (nonatomic, strong) UITableView *shortCommentTableView;
@property BOOL is_fold;
@property (nonatomic, strong) TableViewCell *scriptCell;
@property (nonatomic, strong) TableViewCell *shortCommentCell;
@property (nonatomic, strong) NSMutableArray *imagesUrl;
@property CGFloat heightOfText;
//短评
@property (nonatomic, copy) NSArray *is_FoldArray;
@property (nonatomic, strong) NSMutableArray *shortCommentMutArray;
@property (nonatomic, strong) NSMutableArray *heightOfCommentMutArray;
@property CGFloat heightOfCommentTableview;





- (void)setUI;
@end

NS_ASSUME_NONNULL_END
