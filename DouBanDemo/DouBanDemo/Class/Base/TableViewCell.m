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
    if ([self.reuseIdentifier isEqualToString:@"WTLCell"]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = NO;
        NSLog(@"%@", self.reuseIdentifier);
        return self;
        
    } else if ([self.reuseIdentifier isEqualToString:@"WTLCell3"]){
        
        
        self.zeroSectionScroll = [[DBDFirstCellScrollView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height - [UIScreen mainScreen].bounds.size.height * 1.25 / 7 - [UIScreen mainScreen].bounds.size.height *2/ 9 - 50)];
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
        UIImageView *line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
        [self addSubview:line];
       line.frame = CGRectMake(0, 486, 375, 3);
        
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
        
        
        return self;
        
    }
//        else if (self.cellStyleEnum == 3){
//
//        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//               return self;
//
//    }
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
        } else if (btn.selected == YES) {
            btn.selected = NO;
            self.leftBtn.selected = YES;
        }
    } else if (btn.tag == 122) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.zeroSectionScroll.contentOffset = CGPointMake(0, 0);
            [self.zeroSectionScroll reloadInputViews];
            self.rightBtn.selected = NO;
        } else if (btn.selected == YES) {
            btn.selected = NO;
            self.rightBtn.selected = YES;
        }
    }
    //NSLog(@"%d %d",self.leftButton.selected,self.rightButton.selected);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _rightBtn.frame = CGRectMake(110, 0, 100, 50);
    _leftBtn.frame = CGRectMake(0, 0, 100, 50);
    _lineImage.frame  = CGRectMake(15, 50, self.frame.size.width - 45, 3);
    _allBtn.frame = CGRectMake(self.contentView.frame.size.width - 100, 0, 100, 50);
}

- (void)allBtnClicked {
    [self.cellDelegate clickBtn];
}

@end
