//
//  DBDMovieViewController.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDMovieViewController.h"
#import "DBDHeadView.h"
#import "DBDAllViewController.h"
@interface DBDMovieViewController ()

@end

@implementation DBDMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.movieView = [[DBDMovieView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.movieView];
    [self.movieView setUI];
    self.movieView.mainScrollView.delegate = self;
    
    self.headView = [[DBDMovieHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height *1.25 / 7)];
    [self.view addSubview:self.headView];
    [self.headView setUI];
    self.headView.delegate = self;
    
    self.movieView.tableViewDelegate = self;
    
    
    
    self.navigationController.navigationBar.hidden = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)clickBtn:(UIButton *)btn {
    if (btn.tag == 300) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.headView.twoBtn.selected = NO;
            self.headView.threeBtn.selected = NO;
            self.headView.fourBtn.selected = NO;
            self.headView.fiveBtn.selected = NO;
            self.headView.sixBtn.selected = NO;
            self.movieView.mainScrollView.contentOffset = CGPointMake(0, 0);
            [self.headView.blackLineImageView setFrame:CGRectMake(10, self.headView.frame.size.height - 4, 35, 4)];
        }
    } else if (btn.tag == 301) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.headView.oneBtn.selected = NO;
            self.headView.threeBtn.selected = NO;
            self.headView.fourBtn.selected = NO;
            self.headView.fiveBtn.selected = NO;
            self.headView.sixBtn.selected = NO;
            self.movieView.mainScrollView.contentOffset = CGPointMake(self.headView.frame.size.width, 0);
            [self.headView.blackLineImageView setFrame:CGRectMake(65, self.headView.frame.size.height - 4, 35, 4)];
        
        }
    } else if (btn.tag == 302) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.headView.oneBtn.selected = NO;
            self.headView.twoBtn.selected = NO;
            self.headView.fourBtn.selected = NO;
            self.headView.fiveBtn.selected = NO;
            self.headView.sixBtn.selected = NO;
            self.movieView.mainScrollView.contentOffset = CGPointMake(self.headView.frame.size.width * 2 , 0);
            [self.headView.blackLineImageView setFrame:CGRectMake(120, self.headView.frame.size.height - 4, 35, 4)];
        }
    } else if (btn.tag == 303) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.headView.oneBtn.selected = NO;
            self.headView.twoBtn.selected = NO;
            self.headView.threeBtn.selected = NO;
            self.headView.fiveBtn.selected = NO;
            self.headView.sixBtn.selected = NO;
            self.movieView.mainScrollView.contentOffset = CGPointMake(self.headView.frame.size.width *3, 0);
            [self.headView.blackLineImageView setFrame:CGRectMake(175, self.headView.frame.size.height - 4, 75, 4)];
        }
    } else if (btn.tag == 304) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.headView.twoBtn.selected = NO;
            self.headView.threeBtn.selected = NO;
            self.headView.fourBtn.selected = NO;
            self.headView.oneBtn.selected = NO;
            self.headView.sixBtn.selected = NO;
            self.movieView.mainScrollView.contentOffset = CGPointMake(self.headView.frame.size.width * 4, 0);
            [self.headView.blackLineImageView setFrame:CGRectMake(270, self.headView.frame.size.height - 4, 35, 4)];
        }
    } else if (btn.tag == 305) {
        if (btn.selected == NO) {
            btn.selected = YES;
            self.headView.twoBtn.selected = NO;
            self.headView.threeBtn.selected = NO;
            self.headView.fourBtn.selected = NO;
            self.headView.fiveBtn.selected = NO;
            self.headView.oneBtn.selected = NO;self.movieView.mainScrollView.contentOffset = CGPointMake(self.headView.frame.size.width * 5, 0);
            [self.headView.blackLineImageView setFrame:CGRectMake(325, self.headView.frame.size.height - 4, 35, 4)];
        }
    }
   // [self.headView reloadInputViews];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = self.movieView.mainScrollView.contentOffset.x;
    CGFloat WIDTH = self.view.frame.size.width;
    if (width > WIDTH *2 && width <= WIDTH * 3) {
        [self.headView.blackLineImageView setFrame:CGRectMake(width/7 +10, self.headView.frame.size.height - 4, 80, 4)];
    } else if (width > WIDTH *3){
    [self.headView.blackLineImageView setFrame:CGRectMake(width/6 +10, self.headView.frame.size.height - 4, 40, 4)];
    } else {
        [self.headView.blackLineImageView setFrame:CGRectMake(width/7 +10, self.headView.frame.size.height - 4, 40, 4)];
    }
    if (width > 0 && width <= WIDTH) {
        self.headView.oneBtn.selected = NO;
        self.headView.twoBtn.selected = YES;
        self.headView.threeBtn.selected = NO;
        self.headView.fourBtn.selected = NO;
        self.headView.fiveBtn.selected = NO;
        self.headView.sixBtn.selected = NO;
    }else if (width > WIDTH && width <= WIDTH * 2){
        self.headView.oneBtn.selected = NO;
        self.headView.twoBtn.selected = NO;
        self.headView.threeBtn.selected = YES;
        self.headView.fourBtn.selected = NO;
        self.headView.fiveBtn.selected = NO;
        self.headView.sixBtn.selected = NO;
    } else if (width > WIDTH * 2 && width <= WIDTH * 3) {
        self.headView.oneBtn.selected = NO;
        self.headView.twoBtn.selected = NO;
        self.headView.threeBtn.selected = NO;
        self.headView.fourBtn.selected = YES;
        self.headView.fiveBtn.selected = NO;
        self.headView.sixBtn.selected = NO;
    } else if (width > WIDTH * 3 && width <= WIDTH * 4) {
        self.headView.oneBtn.selected = NO;
        self.headView.twoBtn.selected = NO;
        self.headView.threeBtn.selected = NO;
        self.headView.fourBtn.selected = NO;
        self.headView.fiveBtn.selected = YES;
        self.headView.sixBtn.selected = NO;
    } else if (width > WIDTH * 4 && width <= WIDTH * 5) {
        self.headView.oneBtn.selected = NO;
        self.headView.twoBtn.selected = NO;
        self.headView.threeBtn.selected = NO;
        self.headView.fourBtn.selected = NO;
        self.headView.fiveBtn.selected = NO;
        self.headView.sixBtn.selected = YES;
    } else if (width < WIDTH) {
        self.headView.oneBtn.selected = YES;
        self.headView.twoBtn.selected = NO;
        self.headView.threeBtn.selected = NO;
        self.headView.fourBtn.selected = NO;
        self.headView.fiveBtn.selected = NO;
        self.headView.sixBtn.selected = NO;
    }
   // [self.headView reloadInputViews];
}
- (void)clickCellButton{
    DBDAllViewController *allViewcontroller = [[DBDAllViewController alloc] init];
    allViewcontroller.title = @"院线热映";
    [self.navigationController pushViewController:allViewcontroller animated:NO];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}

@end
