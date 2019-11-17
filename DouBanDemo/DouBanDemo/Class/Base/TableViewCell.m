//
//  TableViewCell.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "TableViewCell.h"
#import "DBDNounButton.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = NO;
    self.leftString = [[NSString alloc] init];
    self.rightString = [[NSString alloc] init];
    if ([self.reuseIdentifier isEqualToString:@"WTLCell"]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = NO;
        NSLog(@"%@", self.reuseIdentifier);
        return self;
        
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCell3"]){
        
        
        self.zeroSectionScroll = [[DBDFirstCellScrollView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height - [UIScreen mainScreen].bounds.size.height * 1.25 / 7 - [UIScreen mainScreen].bounds.size.height * 2 / 9 - 50 + 50)];
        [self.contentView addSubview:self.zeroSectionScroll];
        self.zeroSectionScroll.contentSize = CGSizeMake(0, 0);
        self.zeroSectionScroll.backgroundColor = [UIColor whiteColor];
        self.zeroSectionScroll.contentOffset = CGPointMake(0, 0);
      
        [self.zeroSectionScroll setUI];
        
        
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setTitle:@"影院热映" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_leftBtn];
        [self.leftBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
        [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        self.leftBtn.selected = YES;
        self.leftBtn.tag = 122;
        
        
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setTitle:@"即将上映" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor grayColor]forState:UIControlStateNormal];
        [self.rightBtn addTarget:self action:@selector(colorChange:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        self.rightBtn.selected = NO;
        self.rightBtn.tag = 120;
        
        self.lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
        [self addSubview:self.lineImage];
//        UIImageView *line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
//        [self addSubview:line];
//       line.frame = CGRectMake(0, 486, 375, 3);
        
        self.allBtn = [DBDNounButton buttonWithType:UIButtonTypeCustom];
        [self.allBtn setTitle:@"全部 34" forState:UIControlStateNormal];
        [self.contentView addSubview:self.allBtn];
        [self.allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.allBtn contentRectForBounds:self.allBtn.bounds];
        [self.allBtn setImage:[UIImage imageNamed:@"xiangyou.png"] forState:UIControlStateNormal];
        self.allBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.allBtn addTarget:self action:@selector(allBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [self.contentView addSubview: _rightBtn];
        
        return self;
        
    } else  if ([self.reuseIdentifier isEqualToString:@"WTLCell4"]){
        
        self.advertiseImageView = [[UIImageView alloc] init];
        [self.advertiseImageView setImage:[UIImage imageNamed:@"advertise.png"]];
      //  [self.contentView addSubview:_advertiseImageView];
        return self;
        
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCellAllLeft"]) {
        _leftImageViewOfAll = [[UIImageView alloc] init];
        [self.contentView addSubview:_leftImageViewOfAll];
        _leftImageViewOfAll.backgroundColor = [UIColor orangeColor];
        
        _leftTitleLabelOfAll = [[UILabel alloc] init];
        [self.contentView addSubview:_leftTitleLabelOfAll];
        _leftTitleLabelOfAll.textColor = [UIColor blackColor];
        _leftTitleLabelOfAll.backgroundColor = [UIColor grayColor];
       // _leftTitleLabelOfAll.textAlignment = NSTextAlignmentCenter;
        
        _leftDescriptionLabelOfAll = [[UILabel alloc] init];
        [self.contentView addSubview:_leftDescriptionLabelOfAll];
        _leftDescriptionLabelOfAll.textColor = [UIColor grayColor];
        _leftDescriptionLabelOfAll.backgroundColor = [UIColor grayColor];
        _leftDescriptionLabelOfAll.numberOfLines = 0;
        _leftDescriptionLabelOfAll.font = [UIFont systemFontOfSize:12];
        
        _splitImageView = [[UIImageView alloc] init];
        [_splitImageView setImage:[UIImage imageNamed:@"split.png"]];
        [self.contentView addSubview:_splitImageView];
        
        _buyButton = [[UIButton alloc] init];
        _buyButton.layer.borderWidth = 1;
        [self.contentView addSubview: self.buyButton];
        
        _starButton = [DBDAllMovieStarsButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_starButton];
        
        
        return self;
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCellAllRight"]) {
        return self;
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCellAllMiddle"]) {
        return self;
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCellScript"]) {
        self.plotLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 20, 360, 100)];
        self.plotLabel.numberOfLines = 0;
        self.plotLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.plotLabel];
        self.plotLabel.font = [UIFont systemFontOfSize:16];
        
        self.polotTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        self.polotTitleLabel.textColor = [UIColor whiteColor];
        self.polotTitleLabel.textAlignment = NSTextAlignmentLeft;
        self.polotTitleLabel.text = @"剧情简介";
        [self.contentView addSubview:self.polotTitleLabel];
        
        
        self.foldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.foldBtn.frame = CGRectMake(340, 100, 50, 20);
        self.foldBtn.selected = NO;
        [self.foldBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        self.foldBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.foldBtn setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateNormal];
        [self.foldBtn setTitle:@"展开" forState:UIControlStateNormal];
        [self.foldBtn setTitle:@"关闭" forState:UIControlStateSelected];
        [self.contentView addSubview:self.foldBtn];
        return self;
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCellScriptSecond"]) {
        _previewLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        _previewLabel.textAlignment = NSTextAlignmentLeft;
        _previewLabel.textColor = [UIColor whiteColor];
        _previewLabel.text = @"预告片/剧照";
        [self.contentView addSubview:_previewLabel];
        
        _scriptScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 30, 375, 150)];
        _scriptScroller.contentSize = CGSizeMake(self.scriptScroller.frame.size.width * 12 / 5, 0);
        [self.contentView addSubview:self.scriptScroller];
        self.scriptScroller.backgroundColor = [UIColor clearColor];
        
        self.scriptImageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scriptScroller.frame.size.width * 3 / 5, 150)];
        [self.scriptScroller addSubview:self.scriptImageViewOne];
        
        self.scriptImageViewtwo = [[UIImageView alloc] initWithFrame:CGRectMake(self.scriptScroller.frame.size.width * 3 / 5, 0, self.scriptScroller.frame.size.width * 3 / 5, 150)];
               [self.scriptScroller addSubview:self.scriptImageViewtwo];
        
        self.scriptImageViewthree = [[UIImageView alloc] initWithFrame:CGRectMake(self.scriptScroller.frame.size.width * 6 / 5, 0, self.scriptScroller.frame.size.width * 3 / 5, 150)];
               [self.scriptScroller addSubview:self.scriptImageViewthree];
        
        self.scriptImageViewfour = [[UIImageView alloc] initWithFrame:CGRectMake(self.scriptScroller.frame.size.width * 9 / 5, 0, self.scriptScroller.frame.size.width * 3 / 5, 150)];
               [self.scriptScroller addSubview:self.scriptImageViewfour];
        
        return self;
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCellShortComment"]) {
        self.shortCommentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 335, 50)];
        self.shortCommentLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.shortCommentLabel];
        self.shortCommentLabel.numberOfLines = 0;
        
        self.foldCommentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.foldCommentButton setFrame:CGRectMake(320, 80, 60, 20)];
        self.foldCommentButton.selected = NO;
        [self.foldCommentButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        self.foldCommentButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.foldCommentButton setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateNormal];
        [self.foldCommentButton setTitle:@"展开" forState:UIControlStateNormal];
        [self.foldCommentButton setTitle:@"关闭" forState:UIControlStateSelected];
        [self.contentView addSubview:self.foldCommentButton];
        self.foldCommentButton.alpha = 1;
        return self;
    }
    else {
        
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        return self;
        
    }
}

- (void)colorChange:(UIButton *)btn {
    if (btn.tag == 120) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.leftBtn.selected = NO;
            self.zeroSectionScroll.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
            [self.allBtn setTitle:[NSString stringWithFormat:@"全部 %@",self.rightString] forState:UIControlStateNormal];
            _advertiseImageView.frame = CGRectMake(0, 30, 375, 100);
        } 
    } else if (btn.tag == 122) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.zeroSectionScroll.contentOffset = CGPointMake(0, 0);
            [self.zeroSectionScroll reloadInputViews];
            self.rightBtn.selected = NO;
            [self.allBtn setTitle:[NSString stringWithFormat:@"全部 %@",self.leftString] forState:UIControlStateNormal];
            _advertiseImageView.frame = CGRectMake(0, 0, 375, 100);
        }
    }
    //NSLog(@"%d %d",self.leftButton.selected,self.rightButton.selected);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _rightBtn.frame = CGRectMake(110, 0, 100, 50);
    _leftBtn.frame = CGRectMake(0, 0, 100, 50);
    _lineImage.frame  = CGRectMake(15, 45, self.frame.size.width - 45, 3);
    _allBtn.frame = CGRectMake(self.contentView.frame.size.width - 100, 0, 100, 50);
    _advertiseImageView.frame = CGRectMake(0, 0, 375, 100);
    
    //allMovie
    _leftImageViewOfAll.frame = CGRectMake(10, 10, 100, 130);
    _leftTitleLabelOfAll.frame = CGRectMake(115, 10, 170, 40);
    _leftDescriptionLabelOfAll.frame = CGRectMake(115, 55, 150, 60);
    _splitImageView.frame = CGRectMake(280, 10, 25, 140);
    _buyButton.frame = CGRectMake(300, 60, 70, 40);
    _starButton.frame = CGRectMake(115, 45, 100, 20);
}

- (void)allBtnClicked {
    [self.cellDelegate clickBtn];
}

- (BOOL)changeStar:(DBDAllMovieStarsButton *)button Score:(NSString *)number {
    if ([number  isEqual: @"00"]) {
        button.scoreLabel.text = @"";
        button.tempLabel.text = @"尚未上映";
        return NO;
    } else if ([number  isEqual: @"10"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"15"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"20"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"25"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"30"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"35"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"40"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"45"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        return YES;
    } else if ([number  isEqual: @"50"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        return YES;
    } else {
        return NO;
    }
}
@end
