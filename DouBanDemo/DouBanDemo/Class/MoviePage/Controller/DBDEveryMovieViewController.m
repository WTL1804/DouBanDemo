//
//  DBDEveryMovieViewController.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDEveryMovieViewController.h"
#import "DBDManager.h"
@interface DBDEveryMovieViewController ()

@end

@implementation DBDEveryMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mainView = [[DBDEveryMovieView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_mainView setUI];
    [self.view addSubview:_mainView];
    [self NetWork];
}
- (void)NetWork {
    [[DBDManager sharedLeton] netWorkOfEveryMovieWithID:self.ID success:^(DBDEveryMovieModel *movieModel){
        dispatch_async(dispatch_get_main_queue(), ^{
            self.mainView.titleLabel.text = movieModel.title;
        });
    } error:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
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
