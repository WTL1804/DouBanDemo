//
//  WelComeViewController.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "WelComeViewController.h"
#import "WelcomeView.h"
@interface WelComeViewController ()

@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.13725 green:0.13333 blue:0.15294 alpha:1];
    //设置定时器
    self.advertiseTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Timer) userInfo:nil repeats:YES];
    self.number = 0;
    
    self.welcomeView = [[WelcomeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.welcomeView];
    [self.welcomeView setUI];
    
}
- (void)Timer {
    self.number = self.number + 1;
    
    NSLog(@"还有%d秒进入",2 - self.number);
    
    if (self.number == 2) {
        
        [self.advertiseTimer invalidate];
        
        [self dismissViewControllerAnimated:NO completion:nil];
        
    }
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
