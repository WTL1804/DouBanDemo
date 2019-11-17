//
//  DBDEveryMovieView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDEveryMovieView.h"
#import "TableViewCell.h"
#import <UIImageView+WebCache.h>
@implementation DBDEveryMovieView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    _mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,88, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_mainScroll];
    _mainScroll.contentSize = CGSizeMake(self.frame.size.width, _mainScroll.frame.size.height * 2);
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 0, 190, 40)];
    //_titleLabel.backgroundColor = [UIColor grayColor];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:19];
    [_mainScroll addSubview:_titleLabel];
    
    _originalTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 20, 190, 45)];
    //_originalTitleLabel.backgroundColor = [UIColor grayColor];
    _originalTitleLabel.textColor = [UIColor whiteColor];
    [_mainScroll addSubview:_originalTitleLabel];
    _originalTitleLabel.font = [UIFont systemFontOfSize:14];
    
    
    _movieImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 135)];
    [_mainScroll addSubview: _movieImageView];
    
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 45, 230, 60)];
    _descriptionLabel.textColor = [UIColor grayColor];
    _descriptionLabel.font = [UIFont systemFontOfSize:12];
    _descriptionLabel.numberOfLines = 0;
    [_mainScroll addSubview:_descriptionLabel];
    
    _wantLookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   
    _wantLookBtn.layer.cornerRadius = 15;
    [_wantLookBtn setBackgroundColor:[UIColor whiteColor]];
    [_wantLookBtn setTitle:@"想看" forState:UIControlStateNormal];
    _wantLookBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_wantLookBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_mainScroll addSubview:_wantLookBtn];
    
    _LookedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   
    _LookedBtn.layer.cornerRadius = 15;
    [_LookedBtn setBackgroundColor:[UIColor whiteColor]];
    [_LookedBtn setTitle:@"看过" forState:UIControlStateNormal];
    _LookedBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_LookedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_mainScroll addSubview:_LookedBtn];
    
    _backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 170, 335, 120)];
    _backgroundImage.backgroundColor = [UIColor grayColor];
    _backgroundImage.layer.cornerRadius = 10;
    [_mainScroll addSubview:_backgroundImage];
    
    
    _starButton = [DBDEveryStarButton buttonWithType:UIButtonTypeCustom];
    
    [_backgroundImage addSubview:_starButton];
    
    
    _markLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    _markLabel.textColor = [UIColor whiteColor];
    _markLabel.font = [UIFont systemFontOfSize:15];
    [_backgroundImage addSubview:_markLabel];
    _markLabel.text = @"豆瓣评分";
    
    _lineImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
    [_backgroundImage addSubview:_lineImage];
    
    _peopleLabel = [[UILabel alloc] init];
    [_backgroundImage addSubview:_peopleLabel];
    _peopleLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    _peopleLabel.font = [UIFont systemFontOfSize:10];
    int flag = 1000;
    for (int i = 5; i >= 1; i--) {
        for (int j = i; j >= 1; j--) {
            UIImageView *imageViewStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"star.png"]];
            imageViewStar.frame = CGRectMake(175-j * 8, 75 - i * 8 - i * 4, 8, 8);
            imageViewStar.tag = flag++;
            
            [_backgroundImage addSubview:imageViewStar];
        }
    }
    
    _progressViewFive = [[UIProgressView alloc] initWithFrame:CGRectMake(175, 78 - 5 * 8 - 5 * 4, 120, 40)];
    _progressViewFive.progressTintColor = [UIColor orangeColor];
    _progressViewFive.backgroundColor = [UIColor whiteColor];
    _progressViewFive.progressViewStyle = UIProgressViewStyleDefault;
    _progressViewFive.progress = 0.5;
    [_backgroundImage addSubview:_progressViewFive];
    
    _progressViewFour = [[UIProgressView alloc] initWithFrame:CGRectMake(175, 78 - 4 * 8 - 4 * 4, 120, 40)];
    _progressViewFour.progressTintColor = [UIColor orangeColor];
    _progressViewFour.backgroundColor = [UIColor whiteColor];
    _progressViewFour.progressViewStyle = UIProgressViewStyleDefault;
    _progressViewFour.progress = 0.5;
    [_backgroundImage addSubview:_progressViewFour];
    
    _progressViewThree = [[UIProgressView alloc] initWithFrame:CGRectMake(175, 78 - 3 * 8 - 3 * 4, 120, 40)];
    _progressViewThree.progressTintColor = [UIColor orangeColor];
    _progressViewThree.backgroundColor = [UIColor whiteColor];
    _progressViewThree.progressViewStyle = UIProgressViewStyleDefault;
    _progressViewThree.progress = 0.5;
    [_backgroundImage addSubview:_progressViewThree];
    
    _progressViewTwo = [[UIProgressView alloc] initWithFrame:CGRectMake(175, 78 - 2 * 8 - 2 * 4, 120, 40)];
    _progressViewTwo.progressTintColor = [UIColor orangeColor];
    _progressViewTwo.backgroundColor = [UIColor whiteColor];
    _progressViewTwo.progressViewStyle = UIProgressViewStyleDefault;
    _progressViewTwo.progress = 0.5;
    [_backgroundImage addSubview:_progressViewTwo];
    
    _progressViewOne = [[UIProgressView alloc] initWithFrame:CGRectMake(175, 78 - 1 * 8 - 1 * 4, 120, 40)];
    _progressViewOne.progressTintColor = [UIColor orangeColor];
    _progressViewOne.backgroundColor = [UIColor whiteColor];
    _progressViewOne.progressViewStyle = UIProgressViewStyleDefault;
    _progressViewOne.progress = 0.5;
    [_backgroundImage addSubview:_progressViewOne];
    
    
    
    _peopleHasScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 75, 80, 20)];
    [_backgroundImage addSubview:_peopleHasScoreLabel];
    _peopleHasScoreLabel.font = [UIFont systemFontOfSize:10];
    _peopleHasScoreLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    _noViewLabel = [[UILabel alloc] init];
    [_backgroundImage addSubview:_noViewLabel];
    
    _wantLabel = [[UILabel alloc] init];
    [_backgroundImage addSubview:_wantLabel];
    
    
    _scriptTableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 300, self.frame.size.width-5, 320) style:UITableViewStyleGrouped];
    [_scriptTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCellScript"];
    [_scriptTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCellScriptSecond"];
    [self.mainScroll addSubview:_scriptTableView];
    _scriptTableView.delegate = self;
    _scriptTableView.dataSource = self;
    _is_fold = YES;
    _scriptTableView.backgroundColor = [UIColor clearColor];
    _scriptTableView.contentSize = CGSizeMake(0, 0);
    _scriptTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _scriptTableView.tag = 555;
    
    _shortCommentTableView = [[UITableView alloc] initWithFrame:CGRectMake(20, _scriptTableView.frame.origin.y + _scriptTableView.frame.size.height + 20, 335, 400) style:UITableViewStyleGrouped];
    [_shortCommentTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCellShortComment"];
    [self.mainScroll addSubview:_shortCommentTableView];
    _shortCommentTableView.delegate = self;
    _shortCommentTableView.dataSource = self;
    _shortCommentTableView.backgroundColor = [UIColor clearColor];
    _shortCommentTableView.contentSize = CGSizeMake(0, 0);
    _shortCommentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _shortCommentTableView.tag = 556;
    _is_FoldArray = @[@1,@1,@1,@1];
    
    self.heightOfCommentTableview = 0;
    
    
}
- (void)layoutSubviews {

     [_wantLookBtn setFrame:CGRectMake(120, 105, 120, 45)];
    _starButton.frame = CGRectMake(35, 25, 100, 45);
     [_LookedBtn setFrame:CGRectMake(250, 105, 120, 45)];
    _lineImage.frame = CGRectMake(5, 90, 320, 3);
    _peopleLabel.frame = CGRectMake(200, 92, 140, 28);
    _noViewLabel.frame = CGRectMake(35, 30, 100, 45);
    _wantLabel.frame = CGRectMake(165, 35, 150, 40);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.tag == 555) {
        return 2;
    } else {
        return 4;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 555) {
        if (indexPath.section == 0) {
            if (_is_fold) {
                _scriptCell.foldBtn.frame = CGRectMake(340, 100, 50, 20);
                _scriptCell.plotLabel.frame = CGRectMake(5, 20, 360, 100);
                self.scriptTableView.frame = CGRectMake(5, 300, self.frame.size.width-5, 320);
                return 120;
            } else {
           
                _scriptCell.foldBtn.frame = CGRectMake(340, self.heightOfText, 50, 20);
                _scriptCell.plotLabel.frame = CGRectMake(5, 20, 360, self.heightOfText);
                self.scriptTableView.frame = CGRectMake(5, 300, self.frame.size.width-5, self.heightOfText + 20 + 200);
                return self.heightOfText + 20;
            }
        } else {
            return 200;
        }
    } else {
        return 100 ;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 555) {
        if (indexPath.section == 0) {
            _scriptCell = [self.scriptTableView dequeueReusableCellWithIdentifier:@"WTLCellScript" forIndexPath:indexPath];
            _scriptCell.backgroundColor = [UIColor clearColor];
            [_scriptCell.foldBtn addTarget:self action:@selector(clickFold:) forControlEvents:UIControlEventTouchUpInside];
            self.shortCommentTableView.frame = CGRectMake(20, _scriptTableView.frame.origin.y + _scriptTableView.frame.size.height + 20, 335, 400);
            return _scriptCell;
        } else {
            TableViewCell *cell = [self.scriptTableView dequeueReusableCellWithIdentifier:@"WTLCellScriptSecond" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor clearColor];
        
            if (self.imagesUrl.count != 0 ) {
                [cell.scriptImageViewOne sd_setImageWithURL:self.imagesUrl[0]];
                [cell.scriptImageViewtwo sd_setImageWithURL:self.imagesUrl[1]];
                [cell.scriptImageViewthree sd_setImageWithURL:self.imagesUrl[2]];
                [cell.scriptImageViewfour sd_setImageWithURL:self.imagesUrl[3]];
            }
            self.shortCommentTableView.frame = CGRectMake(20, _scriptTableView.frame.origin.y + _scriptTableView.frame.size.height + 20, 335, 400);
            return cell;
        }
    } else {
        _shortCommentCell = [self.shortCommentTableView dequeueReusableCellWithIdentifier:@"WTLCellShortComment" forIndexPath:indexPath];
        _shortCommentCell.backgroundColor = [UIColor clearColor];
        if (self.shortCommentMutArray.count != 0) {
            _shortCommentCell.shortCommentLabel.text
            = self.shortCommentMutArray[indexPath.section];
        }
        
        [_shortCommentCell.foldCommentButton  addTarget:self action:@selector(clickCommentFold:) forControlEvents:UIControlEventTouchUpInside];
        if (_shortCommentCell.foldCommentButton.selected == YES) {
            
            CGFloat hei = [self.heightOfCommentMutArray[indexPath.section] floatValue];
            NSLog(@"%f",[self.heightOfCommentMutArray[indexPath.section] floatValue]);
            self.heightOfCommentTableview += hei;
            self.heightOfCommentTableview +=50;
        } else {
            self.heightOfCommentTableview += 100;
        }
        if (indexPath.section == 3) {
          self.shortCommentTableView.frame = CGRectMake(20, _scriptTableView.frame.origin.y + _scriptTableView.frame.size.height + 20, 335, self.heightOfCommentTableview);
            self.heightOfCommentTableview = 0;
        }
         return _shortCommentCell;
    }
        
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (void)clickFold:(UIButton *)btn {
    if(_is_fold == YES) {
        _is_fold = NO;
        btn.selected = YES;
        
    } else {
        _is_fold = YES;
        btn.selected = NO;
    }
    [self.scriptTableView reloadData];
}

- (void)clickCommentFold:(UIButton *)btn {
    if (btn.selected ==  YES) {
        btn.selected = NO;
        
    } else {
        btn.selected = YES;
    }
    [self.shortCommentTableView reloadData];
}
@end
