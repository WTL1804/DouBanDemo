//
//  DBDAllViewController.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/19.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDAllViewController.h"
#import "DBDManager.h"
#import <UIImageView+WebCache.h>
#import "DBDEveryMovieViewController.h"
#import <SOZOChromoplast.h>

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
    self.allMovieView.mainScroll.delegate = self;
    
    self.headView = [[DBDAllOfHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 1.25 / 7)];
    [self.view addSubview:self.headView];
    [self.headView setUI];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(colorClickChange:) name:@"clickColorChange" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickAllBtn) name:@"clickAllMovieBtn" object:nil];
    
    [self ImageFetch];
    
    //监听tableView滑动
    [self.allMovieView.leftTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    self.is_Refresh = NO;
    
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
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;

}
- (void)colorClickChange:(NSNotification *)noti {
    UIButton *btn = [noti object];
    if (btn.selected == NO) {
        if (btn.tag == 2000) {
            self.headView.leftBtn.selected = YES;
            self.headView.rightBtn.selected = NO;
            self.headView.middleBtn.selected = NO;
            [self.headView.scorllLineImageView setFrame:CGRectMake(self.view.frame.size.width / 12, 141, 72, 2)];
            self.allMovieView.mainScroll.contentOffset  = CGPointMake(0, 0);
        }
        if (btn.tag == 2001) {
            self.headView.leftBtn.selected = NO;
            self.headView.rightBtn.selected = NO;
            self.headView.middleBtn.selected = YES;
            [self.headView.scorllLineImageView setFrame:CGRectMake(self.view.frame.size.width * 5 / 12, 141, 72, 2)];
            self.allMovieView.mainScroll.contentOffset  = CGPointMake(375, 0);
        }
        if (btn.tag == 2002) {
            self.headView.leftBtn.selected = NO;
            self.headView.rightBtn.selected = YES;
            self.headView.middleBtn.selected = NO;
            [self.headView.scorllLineImageView setFrame:CGRectMake(self.view.frame.size.width * 3.05 / 4, 141, 72, 2)];
            self.allMovieView.mainScroll.contentOffset  = CGPointMake(750, 0);
        }
        
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = self.allMovieView.mainScroll.contentOffset.x;
    CGFloat WIDTH = self.view.frame.size.width;
    NSLog(@"%f",width);
    if (width >= 0 && width < WIDTH ) {
        [self.headView.scorllLineImageView setFrame:CGRectMake(width /7 + 34, 141, 72, 2)];
   } else if (width >= WIDTH < WIDTH * 2) {
        [self.headView.scorllLineImageView setFrame:CGRectMake(width / 3 + 36, 141, 72, 2)];
   }
    if (width < WIDTH) {
        self.headView.leftBtn.selected = YES;
        self.headView.middleBtn.selected = NO;
        self.headView.rightBtn.selected = NO;
    } else if (width >= WIDTH && width < WIDTH * 2) {
        self.headView.leftBtn.selected = NO;
        self.headView.middleBtn.selected = YES;
        self.headView.rightBtn.selected = NO;
    } else {
        self.headView.leftBtn.selected = NO;
        self.headView.middleBtn.selected = NO;
        self.headView.rightBtn.selected = YES;
    }
}
- (void)ImageFetch {
    [[DBDManager sharedLeton] netWorkWithNumber:1 succeed:^(DBDMovieModel *allMovieModel) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.allMovieView.urlMutArray = [[NSMutableArray alloc] init];
            self.allMovieView.titleMutArray = [[NSMutableArray alloc] init];
            self.allMovieView.descriptionMutArray = [[NSMutableArray alloc] init];
    
            self.allMovieView.scoreMutArray = [[NSMutableArray alloc] init];
            self.allMovieView.starMutArray = [[NSMutableArray alloc] init];
            self.allMovieView.buyMutArray = [[NSMutableArray alloc] init];
            self.allMovieView.IDMutArray = [[NSMutableArray alloc] init];
//           NSLog(@"%@", [allMovieModel.subjects[0] valueForKey:@"pubdates"]);
//            NSLog(@"%@",[allMovieModel.subjects[0] valueForKey:@"year"]);
//            NSLog(@"%@",[allMovieModel.subjects[0] valueForKey:@"genres"]);
            for(int i = 0; i < 5; i++) {
                NSURL *url = [NSURL URLWithString:[[allMovieModel.subjects[i] valueForKey:@"images"] valueForKey:@"small"]];
                [self.allMovieView.urlMutArray addObject:url];
                
            
                [self.allMovieView.titleMutArray addObject:[allMovieModel.subjects[i] valueForKey:@"title"]];
                NSMutableString *descriptionMutString = [[NSMutableString alloc] init];
                NSString *string1 = [NSString stringWithFormat:@"%@/",[allMovieModel.subjects[i] valueForKey:@"year"]];
                [descriptionMutString appendString:string1];
                
                NSArray * array = [allMovieModel.subjects[i] valueForKey:@"pubdates"];
                for (int j = 0; j < array.count; j++) {
                    NSString *tempString = [array[j] substringFromIndex:11];
                    tempString = [tempString substringToIndex:tempString.length - 1];
                    if (j < array.count - 1) {
                        tempString = [NSString stringWithFormat:@"%@ ",tempString];
                    } else {
                        tempString = [NSString stringWithFormat:@"%@/", tempString];
                    }
                    [descriptionMutString appendString:tempString];
                }
                array = [allMovieModel.subjects[i] valueForKey:@"genres"];
                for (int j = 0; j < array.count; j++) {
                    NSString *tempString = array[j];
                    if (j < array.count - 1) {
                        tempString = [NSString stringWithFormat:@"%@ ",tempString];
                    } else {
                        tempString = [NSString stringWithFormat:@"%@/", tempString];
                    }
                        [descriptionMutString appendString:tempString];
                }
                array = [allMovieModel.subjects[i] valueForKey:@"directors"];
                for (int j = 0; j < array.count; j++) {
                    NSString *tempString = [array[j] valueForKey:@"name"];;
                    if (j < array.count - 1) {
                        tempString = [NSString stringWithFormat:@"%@ ",tempString];
                    } else {
                        tempString = [NSString stringWithFormat:@"%@/", tempString];
                    }
                        [descriptionMutString appendString:tempString];
                }
                array = [allMovieModel.subjects[i] valueForKey:@"casts"];
                for (int j = 0; j < array.count; j++) {
                    NSString *tempString = [array[j] valueForKey:@"name"];;
                    if (j < array.count - 1) {
                        tempString = [NSString stringWithFormat:@"%@ ",tempString];
                    } else {
                        tempString = [NSString stringWithFormat:@"%@/", tempString];
                    }
                        [descriptionMutString appendString:tempString];
                }
              
                [self.allMovieView.descriptionMutArray addObject:descriptionMutString];
        
                
                [self.allMovieView.starMutArray addObject:[[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"stars"]];
                [self.allMovieView.scoreMutArray addObject:[[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"average"]];
                if ([[[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"stars"] isEqual:@"00"]) {
                    [self.allMovieView.buyMutArray addObject:@"NO"];
                    NSLog(@"%@", [[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"stars"]);
                    } else {
                        [self.allMovieView.buyMutArray addObject:@"YES"];
                        
                    }
                
                [self.allMovieView.IDMutArray addObject: [allMovieModel.subjects[i] valueForKey:@"ID"]];
            }

        
            [self.allMovieView.leftTableView reloadData];
        });
       
    } error:^(NSError *error) {
        
        NSLog(@"请求失败");
    }];
}

- (void)scrollFetch {
     [[DBDManager sharedLeton] netWorkWithNumber:1 succeed:^(DBDMovieModel *allMovieModel) {
            dispatch_async(dispatch_get_main_queue(), ^{
                for(int i = 5; i < 10; i++) {
                    NSURL *url = [NSURL URLWithString:[[allMovieModel.subjects[i] valueForKey:@"images"] valueForKey:@"small"]];
                    [self.allMovieView.urlMutArray addObject:url];
                    
                
                    [self.allMovieView.titleMutArray addObject:[allMovieModel.subjects[i] valueForKey:@"title"]];
                    NSMutableString *descriptionMutString = [[NSMutableString alloc] init];
                    NSString *string1 = [NSString stringWithFormat:@"%@/",[allMovieModel.subjects[i] valueForKey:@"year"]];
                    [descriptionMutString appendString:string1];
                    
                    NSArray * array = [allMovieModel.subjects[i] valueForKey:@"pubdates"];
                    for (int j = 0; j < array.count; j++) {
                        NSString *tempString = [array[j] substringFromIndex:11];
                        tempString = [tempString substringToIndex:tempString.length - 1];
                        if (j < array.count - 1) {
                            tempString = [NSString stringWithFormat:@"%@ ",tempString];
                        } else {
                            tempString = [NSString stringWithFormat:@"%@/", tempString];
                        }
                        [descriptionMutString appendString:tempString];
                    }
                    array = [allMovieModel.subjects[i] valueForKey:@"genres"];
                    for (int j = 0; j < array.count; j++) {
                        NSString *tempString = array[j];
                        if (j < array.count - 1) {
                            tempString = [NSString stringWithFormat:@"%@ ",tempString];
                        } else {
                            tempString = [NSString stringWithFormat:@"%@/", tempString];
                        }
                            [descriptionMutString appendString:tempString];
                    }
                    array = [allMovieModel.subjects[i] valueForKey:@"directors"];
                    for (int j = 0; j < array.count; j++) {
                        NSString *tempString = [array[j] valueForKey:@"name"];;
                        if (j < array.count - 1) {
                            tempString = [NSString stringWithFormat:@"%@ ",tempString];
                        } else {
                            tempString = [NSString stringWithFormat:@"%@/", tempString];
                        }
                            [descriptionMutString appendString:tempString];
                    }
                    array = [allMovieModel.subjects[i] valueForKey:@"casts"];
                    for (int j = 0; j < array.count; j++) {
                        NSString *tempString = [array[j] valueForKey:@"name"];;
                        if (j < array.count - 1) {
                            tempString = [NSString stringWithFormat:@"%@ ",tempString];
                        } else {
                            tempString = [NSString stringWithFormat:@"%@/", tempString];
                        }
                            [descriptionMutString appendString:tempString];
                    }
                  
                    [self.allMovieView.descriptionMutArray addObject:descriptionMutString];
            
                    
                    
                    [self.allMovieView.starMutArray addObject:[[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"stars"]];
                    [self.allMovieView.scoreMutArray addObject:[[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"average"]];
                    if ([[[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"stars"] isEqual:@"00"]) {
                        [self.allMovieView.buyMutArray addObject:@"NO"];
                        NSLog(@"%@", [[allMovieModel.subjects[i] valueForKey:@"rating"] valueForKey:@"stars"]);
                        } else {
                            [self.allMovieView.buyMutArray addObject:@"YES"];
                            
                        }
                    [self.allMovieView.IDMutArray addObject: [allMovieModel.subjects[i] valueForKey:@"ID"]];
                }

                [self.allMovieView.leftTableView reloadData];
                NSLog(@"%@", self.allMovieView.starMutArray);
            });
           
        } error:^(NSError *error) {
            
            NSLog(@"请求失败");
        }];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGPoint offset = [[change valueForKey:@"new"] CGPointValue];
    if (offset.y > 130) {
        if (self.is_Refresh == NO) {
            [self scrollFetch];
            self.is_Refresh = YES;
        }
    }
}
- (void)clickAllBtn {
    NSLog(@"1");
    DBDEveryMovieViewController *every = [[DBDEveryMovieViewController alloc] init];
    NSIndexPath *indexPath = [self.allMovieView.leftTableView indexPathForSelectedRow];
    TableViewCell *cell = [self.allMovieView.leftTableView cellForRowAtIndexPath:indexPath];
    UIImage *image = [cell.leftImageViewOfAll image];
    SOZOChromoplast *color = [[SOZOChromoplast alloc] initWithImage:image];
    every.colorMutArray = [[NSMutableArray alloc] init];
       [every.colorMutArray addObject:color];
    
    
    every.ID = self.allMovieView.IDMutArray[indexPath.section];
   
    [self.navigationController pushViewController:every animated:NO];
}
- (void)dealloc {
    [self.allMovieView.leftTableView removeObserver:self forKeyPath:@"contentOffset"];
}
@end
