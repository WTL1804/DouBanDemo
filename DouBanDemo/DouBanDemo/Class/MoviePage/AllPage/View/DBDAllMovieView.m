//
//  AllMovieView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/19.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDAllMovieView.h"
#import "TableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation DBDAllMovieView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    _mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 1.25/7 * self.frame.size.height, self.frame.size.width, self.frame.size.height * 5.75/7)];
    [self addSubview:_mainScroll];
    _mainScroll.contentSize = CGSizeMake(self.frame.size.width * 3, 0);
    _mainScroll.pagingEnabled = YES;
    
    
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 5.75/7)];
    [self.mainScroll addSubview:_leftTableView];
    _leftTableView.dataSource = self;
    _leftTableView.delegate = self;
    [_leftTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCellAllLeft"];
    _leftTableView.tag = 9527;
    
    _middleTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height * 5.75/7)];
    [self.mainScroll addSubview:_middleTableView];
    _middleTableView.dataSource = self;
    _middleTableView.delegate = self;
    [_middleTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCellAllMiddle"];
    _middleTableView.tag = 9529;
    
    
    
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width * 2, 0, self.frame.size.width, self.frame.size.height * 5.75/7)];
    [self.mainScroll addSubview:_rightTableView];
    _rightTableView.dataSource = self;
       _rightTableView.delegate = self;
    [_rightTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCellAllRight"];
    _rightTableView.tag = 9528;
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_titleMutArray == NULL) {
        
        return 5;
    } else {
        return _titleMutArray.count;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 9527) {
    _leftCell = [_leftTableView dequeueReusableCellWithIdentifier:@"WTLCellAllLeft" forIndexPath:indexPath];
        if (_urlMutArray != NULL) {
            [_leftCell.leftImageViewOfAll sd_setImageWithURL:_urlMutArray[indexPath.section]];
        }
        if (_titleMutArray != NULL) {
            _leftCell.leftTitleLabelOfAll.backgroundColor = [UIColor whiteColor];
            _leftCell.leftTitleLabelOfAll.text = self.titleMutArray[indexPath.section];
        }
        if (_descriptionMutArray != NULL) {
            _leftCell.leftDescriptionLabelOfAll.backgroundColor = [UIColor whiteColor];
            _leftCell.leftDescriptionLabelOfAll.text = _descriptionMutArray[indexPath.section];
        }
        if (_starMutArray != NULL) {
            [_leftCell changeStar:_leftCell.starButton Score:_starMutArray[indexPath.section]];
        }
        if (_scoreMutArray != NULL) {
            _leftCell.starButton.scoreLabel.text = _scoreMutArray[indexPath.section];
        }
        if (_buyMutArray != NULL) {
            if ([_buyMutArray[indexPath.section] isEqual:@"NO"]) {
            [_leftCell.buyButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
            _leftCell.buyButton.layer.borderColor = [UIColor yellowColor].CGColor;
            [_leftCell.buyButton setTitle:@"预售" forState:UIControlStateNormal];
                _leftCell.starButton.scoreLabel.text = @"";
                [_leftCell.starButton.oneStarImageView setImage:[UIImage new]];
                [_leftCell.starButton.twoStarImageView setImage:[UIImage new]];
                [_leftCell.starButton.threeStarImageView setImage:[UIImage new]];
                [_leftCell.starButton.fourStarImageView setImage:[UIImage new]];
                [_leftCell.starButton.fiveStarImageView setImage:[UIImage new]];
                
            } else {
                [_leftCell.buyButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                _leftCell.buyButton.layer.borderColor = [UIColor redColor].CGColor;
                [_leftCell.buyButton setTitle:@"购票" forState:UIControlStateNormal];
                _leftCell.starButton.tempLabel.text = @"";
        }
    }
        
    return _leftCell;
    } else if (tableView.tag == 9528){
        _rightCell = [_rightTableView dequeueReusableCellWithIdentifier:@"WTLCellAllRight" forIndexPath:indexPath];
        return _rightCell;
    } else {
        _middleCell = [_middleTableView dequeueReusableCellWithIdentifier:@"WTLCellAllMiddle" forIndexPath:indexPath];
        return _middleCell;
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clickAllMovieBtn" object:nil];
}
@end
