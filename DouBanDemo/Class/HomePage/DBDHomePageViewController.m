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
    [self presentViewController:welViewController animated:NO completion:nil];
    
    self.homeView = [[DBDHomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.homeView];
    [self.homeView setUI];
    
    self.headView = [[DBDHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height *1.25 / 7)];
    [self.view addSubview:self.headView];
    [self.headView setUI];
    
    
    
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

@end
