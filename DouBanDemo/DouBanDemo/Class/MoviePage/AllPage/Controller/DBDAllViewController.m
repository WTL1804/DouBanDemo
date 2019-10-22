//
//  DBDAllViewController.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/19.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDAllViewController.h"

@interface DBDAllViewController ()

@end

@implementation DBDAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.allMovieView = [[DBDAllMovieView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.allMovieView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.allMovieView];
    [self.allMovieView setUI];
    self.headView = [[DBDAllOfHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 1.25 / 7)];
    [self.view addSubview:self.headView];
    [self.headView setUI];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.backItem.title = @"";
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
