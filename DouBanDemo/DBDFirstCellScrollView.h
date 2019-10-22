//
//  firstCellScrollView.h
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/11.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBDBaseButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface DBDFirstCellScrollView : UIScrollView
//正在热映的button
@property (nonatomic, strong) DBDBaseButton *firstButton;
@property (nonatomic, strong) DBDBaseButton *secondButton;
@property (nonatomic, strong) DBDBaseButton *thirdButton;
@property (nonatomic, strong) DBDBaseButton *fouthButton;
@property (nonatomic, strong) DBDBaseButton *fifthButton;
@property (nonatomic, strong) DBDBaseButton *sixthButton;

//即将上映的button
@property (nonatomic, strong) DBDBaseButton *oneButton;
@property (nonatomic, strong) DBDBaseButton *twoButton;
@property (nonatomic, strong) DBDBaseButton *threeButton;
@property (nonatomic, strong) DBDBaseButton *fourButton;
@property (nonatomic, strong) DBDBaseButton *fiveButton;
@property (nonatomic, strong) DBDBaseButton *sixButton;



- (void)setUI;

@end

NS_ASSUME_NONNULL_END
