//
//  DBDHomePageViewController.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDHomePageViewController.h"
#import "WelComeViewController.h"
#import <Masonry.h>
@interface DBDHomePageViewController ()

@end

@implementation DBDHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //模态切换到欢迎界面
    WelComeViewController *welViewController = [[WelComeViewController alloc] init];
    welViewController.modalPresentationStyle = 0;
   // [self presentViewController:welViewController animated:NO completion:nil];
    
    self.homeView = [[DBDHomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.homeView];
    [self.homeView setUI];
    
    self.headView = [[DBDHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height *1.25 / 7)];
    [self.view addSubview:self.headView];
    [self.headView setUI];
    
    self.headView.delegate = self;
    self.homeView.mainScroll.delegate = self;
    
    
    
    self.navigationController.navigationBar.hidden = YES;
}
- (void)clickButton:(UIButton *)btn {
        if (btn.tag == 120) {
            if (btn.selected == NO) {
                btn.selected = YES;
                self.headView.leftButton.selected = NO;
                self.homeView.mainScroll.contentOffset = CGPointMake(self.view.frame.size.width, 0);
                [self.headView.greenImageView setFrame:CGRectMake(self.headView.frame.size.width/2 + 10, self.headView.frame.size.height - 4, 40, 4)];
            } else if (btn.selected == YES) {
                btn.selected = NO;
                self.headView.leftButton.selected = YES;
                self.homeView.mainScroll.contentOffset = CGPointMake(0, 0);
            }
        } else if (btn.tag == 122) {
            if (btn.selected == NO) {
                btn.selected = YES;
                self.headView.rightButton.selected = NO;
                self.homeView.mainScroll.contentOffset = CGPointMake(0, 0);
                [self.headView.greenImageView setFrame:CGRectMake(self.headView.frame.size.width/2 - 50, self.headView.frame.size.height - 4, 40, 4)];
            } else if (btn.selected == YES) {
                btn.selected = NO;
                self.headView.rightButton.selected = YES;
                self.homeView.mainScroll.contentOffset = CGPointMake(self.view.frame.size.width, 0);
            }
        }

    [self.homeView.mainScroll reloadInputViews];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = self.homeView.mainScroll.contentOffset.x;
    if (width < 200){
    [self.headView.greenImageView setFrame:CGRectMake(self.headView.frame.size.width/2 - 50 + width / 3, self.headView.frame.size.height - 4, 40, 4)];
    }
    if (width > 10) {
        self.headView.leftButton.selected = NO;
        self.headView.rightButton.selected = YES;
    } else if (width < self.view.frame.size.width - 10) {
        self.headView.leftButton.selected = YES;
        self.headView.rightButton.selected = NO;
    } else {
        return;
    }
    NSLog(@"%f",width);
}
@end
