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
#import "DBDManager.h"
#import "TableViewCell.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import "DBDEveryMovieViewController.h"
#import <SOZOChromoplast.h>
@interface DBDMovieViewController ()

@end

@implementation DBDMovieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hotMovie];
    [self futureMovie];
    self.movieView = [[DBDMovieView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.movieView];
    self.movieView.allMovieArray = [[NSMutableArray alloc] init];
    [self.movieView setUI];
    [self.movieView.activityIndicator startAnimating];
    self.movieView.mainScrollView.delegate = self;
    _modelMutArray = [[NSMutableArray alloc] init];
    
    
    
    self.headView = [[DBDMovieHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height *1.25 / 7)];
    [self.view addSubview:self.headView];
    [self.headView setUI];
    self.headView.delegate = self;
    
    self.movieView.tableViewDelegate = self;
    
    
    self.navigationController.navigationBar.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieBtn:) name:@"clickBtn" object:nil];
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
- (void)hotMovie {
    [[DBDManager sharedLeton] netWorkWithNumber:1 succeed:^(DBDMovieModel *allMovieModel){
        dispatch_async(dispatch_get_main_queue(), ^{
        self.movieView.cell.zeroSectionScroll.firstButton.label.text = [allMovieModel.subjects[0] valueForKey:@"title"];
            NSURL *url = [NSURL URLWithString:[[allMovieModel.subjects[0] valueForKey:@"images"] valueForKey:@"small"]];
            [self.movieView.cell.zeroSectionScroll.firstButton sd_setBackgroundImageWithURL:url forState:UIControlStateNormal];
            self.movieView.cell.zeroSectionScroll.firstButton.scoreLabel.text = [[allMovieModel.subjects[0] valueForKey:@"rating"] valueForKey:@"average"];
            [self changeStar:self.movieView.cell.zeroSectionScroll.firstButton Score:[[allMovieModel.subjects[0] valueForKey:@"rating"] valueForKey:@"stars"]];
            self.movieView.cell.zeroSectionScroll.firstButton.ID = [allMovieModel.subjects[0] valueForKey:@"ID"];
            
            
            
        self.movieView.cell.zeroSectionScroll.secondButton.label.text = [allMovieModel.subjects[1] valueForKey:@"title"];
        NSURL *url1 = [NSURL URLWithString:[[allMovieModel.subjects[1] valueForKey:@"images"] valueForKey:@"small"]];
            [self.movieView.cell.zeroSectionScroll.secondButton sd_setBackgroundImageWithURL:url1 forState:UIControlStateNormal];
    self.movieView.cell.zeroSectionScroll.secondButton.scoreLabel.text = [[allMovieModel.subjects[1] valueForKey:@"rating"] valueForKey:@"average"];
            [self changeStar:self.movieView.cell.zeroSectionScroll.secondButton Score:[[allMovieModel.subjects[1] valueForKey:@"rating"] valueForKey:@"stars"]];
            self.movieView.cell.zeroSectionScroll.secondButton.ID = [allMovieModel.subjects[1] valueForKey:@"ID"];;
            
       

            
        self.movieView.cell.zeroSectionScroll.thirdButton.label.text = [allMovieModel.subjects[2] valueForKey:@"title"];
        NSURL *url2 = [NSURL URLWithString:[[allMovieModel.subjects[2] valueForKey:@"images"] valueForKey:@"small"]];
            [self.movieView.cell.zeroSectionScroll.thirdButton sd_setBackgroundImageWithURL:url2 forState:UIControlStateNormal];
           self.movieView.cell.zeroSectionScroll.thirdButton.scoreLabel.text = [[allMovieModel.subjects[2] valueForKey:@"rating"] valueForKey:@"average"];
             [self changeStar:self.movieView.cell.zeroSectionScroll.thirdButton Score:[[allMovieModel.subjects[2] valueForKey:@"rating"] valueForKey:@"stars"]];
            self.movieView.cell.zeroSectionScroll.thirdButton.ID = [allMovieModel.subjects[2] valueForKey:@"ID"];;
            
            
            
        self.movieView.cell.zeroSectionScroll.fouthButton.label.text = [allMovieModel.subjects[3] valueForKey:@"title"];
        NSURL *url3 = [NSURL URLWithString:[[allMovieModel.subjects[3] valueForKey:@"images"] valueForKey:@"small"]];
            [self.movieView.cell.zeroSectionScroll.fouthButton sd_setBackgroundImageWithURL:url3 forState:UIControlStateNormal];
         self.movieView.cell.zeroSectionScroll.fouthButton.scoreLabel.text = [[allMovieModel.subjects[3] valueForKey:@"rating"] valueForKey:@"average"];
            [self changeStar:self.movieView.cell.zeroSectionScroll.fouthButton Score:[[allMovieModel.subjects[3] valueForKey:@"rating"] valueForKey:@"stars"]];
            self.movieView.cell.zeroSectionScroll.fouthButton.ID = [allMovieModel.subjects[3] valueForKey:@"ID"];;
            
            
            
        self.movieView.cell.zeroSectionScroll.fifthButton.label.text = [allMovieModel.subjects[4] valueForKey:@"title"];
            NSURL *url4 = [NSURL URLWithString:[[allMovieModel.subjects[4] valueForKey:@"images"] valueForKey:@"small"]];
            [self.movieView.cell.zeroSectionScroll.fifthButton sd_setBackgroundImageWithURL:url4 forState:UIControlStateNormal];
        self.movieView.cell.zeroSectionScroll.fifthButton.scoreLabel.text = [[allMovieModel.subjects[4] valueForKey:@"rating"] valueForKey:@"average"];
            
            [self changeStar:self.movieView.cell.zeroSectionScroll.fifthButton Score:[[allMovieModel.subjects[4] valueForKey:@"rating"] valueForKey:@"stars"]];
            self.movieView.cell.zeroSectionScroll.fifthButton.ID = [allMovieModel.subjects[4] valueForKey:@"ID"];;
            
            
            
        self.movieView.cell.zeroSectionScroll.sixthButton.label.text = [allMovieModel.subjects[5] valueForKey:@"title"];
            NSURL *url5 = [NSURL URLWithString:[[allMovieModel.subjects[5] valueForKey:@"images"] valueForKey:@"small"]];
            [self.movieView.cell.zeroSectionScroll.sixthButton sd_setBackgroundImageWithURL:url5 forState:UIControlStateNormal];
            self.movieView.cell.zeroSectionScroll.sixthButton.scoreLabel.text = [[allMovieModel.subjects[5] valueForKey:@"rating"] valueForKey:@"average"];
            
            [self changeStar:self.movieView.cell.zeroSectionScroll.sixthButton Score:[[allMovieModel.subjects[5] valueForKey:@"rating"] valueForKey:@"stars"]];
            self.movieView.cell.zeroSectionScroll.sixthButton.ID = [allMovieModel.subjects[5] valueForKey:@"ID"];;
            
            
            NSString *string = [NSString stringWithFormat:@"全部 %@",allMovieModel.total];
            [self.movieView.cell.allBtn setTitle:string forState:UIControlStateNormal];
            [self.movieView reloadInputViews];
            
            [self.movieView.activityIndicator stopAnimating];
        });
        
        self.movieView.cell.leftString = allMovieModel.total;
        
        
         }error:^(NSError *error){
             NSLog(@"请求失败");
         }];
    
    
}
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}
- (void)futureMovie{
    [[DBDManager sharedLeton] netWorkFetureMovieSuccess:^(DBDFutureMovie *futureModel){
        self.movieView.cell.rightString = futureModel.total;
        [[DBDManager sharedLeton] netWorkOfWishWithID:[futureModel.subjects[0] valueForKey:@"ID"] success:^(DBDWishModel *wishMode) {
           dispatch_async(dispatch_get_main_queue(), ^{ self.movieView.cell.zeroSectionScroll.oneButton.wantLabel.text = [NSString stringWithFormat:@"%@人想看",wishMode.wish_count];
           });
        }error:^(NSError *error) {
            NSLog(@"请求失败");
        }];
        [[DBDManager sharedLeton] netWorkOfWishWithID:[futureModel.subjects[1] valueForKey:@"ID"] success:^(DBDWishModel *wishMode) {
           dispatch_async(dispatch_get_main_queue(), ^{ self.movieView.cell.zeroSectionScroll.twoButton.wantLabel.text = [NSString stringWithFormat:@"%@人想看",wishMode.wish_count];
           });
        }error:^(NSError *error) {
            NSLog(@"请求失败");
        }];
        [[DBDManager sharedLeton] netWorkOfWishWithID:[futureModel.subjects[2] valueForKey:@"ID"] success:^(DBDWishModel *wishMode) {
           dispatch_async(dispatch_get_main_queue(), ^{ self.movieView.cell.zeroSectionScroll.threeButton.wantLabel.text = [NSString stringWithFormat:@"%@人想看",wishMode.wish_count];
           });
        }error:^(NSError *error) {
            NSLog(@"请求失败");
        }];
        [[DBDManager sharedLeton] netWorkOfWishWithID:[futureModel.subjects[3] valueForKey:@"ID"] success:^(DBDWishModel *wishMode) {
           dispatch_async(dispatch_get_main_queue(), ^{ self.movieView.cell.zeroSectionScroll.fourButton.wantLabel.text = [NSString stringWithFormat:@"%@人想看",wishMode.wish_count];
           });
        }error:^(NSError *error) {
            NSLog(@"请求失败");
        }];
        [[DBDManager sharedLeton] netWorkOfWishWithID:[futureModel.subjects[4] valueForKey:@"ID"] success:^(DBDWishModel *wishMode) {
           dispatch_async(dispatch_get_main_queue(), ^{ self.movieView.cell.zeroSectionScroll.fiveButton.wantLabel.text = [NSString stringWithFormat:@"%@人想看",wishMode.wish_count];
           });
        }error:^(NSError *error) {
            NSLog(@"请求失败");
        }];
        [[DBDManager sharedLeton] netWorkOfWishWithID:[futureModel.subjects[5] valueForKey:@"ID"] success:^(DBDWishModel *wishMode) {
           dispatch_async(dispatch_get_main_queue(), ^{ self.movieView.cell.zeroSectionScroll.sixButton.wantLabel.text = [NSString stringWithFormat:@"%@人想看",wishMode.wish_count];
               
               
               
           });
        }error:^(NSError *error) {
            NSLog(@"请求失败");
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *stringM =[[NSString alloc] init];
            NSString *stringD = [[NSString alloc] init];
            self.movieView.cell.zeroSectionScroll.oneButton.label.text = [futureModel.subjects[0] valueForKey:@"title"];
            NSURL *url = [NSURL URLWithString:[[futureModel.subjects[0] valueForKey:@"images"] valueForKey:@"small"]];
                [self.movieView.cell.zeroSectionScroll.oneButton sd_setBackgroundImageWithURL:url forState:UIControlStateNormal];
            stringM = [futureModel.subjects[0] valueForKey:@"mainland_pubdate"];
            stringM = [stringM substringWithRange:NSMakeRange(5, 2)];
            stringD = [futureModel.subjects[0] valueForKey:@"mainland_pubdate"];
            stringD = [stringD substringWithRange:NSMakeRange(8, 2)];
        self.movieView.cell.zeroSectionScroll.oneButton.dataLabel.text = [NSString stringWithFormat:@"%@月%@日",stringM, stringD];
            self.movieView.cell.zeroSectionScroll.oneButton.ID = [futureModel.subjects[0] valueForKey:@"ID"];
            
            self.movieView.cell.zeroSectionScroll.twoButton.label.text = [futureModel.subjects[1] valueForKey:@"title"];
            NSURL *url1 = [NSURL URLWithString:[[futureModel.subjects[1] valueForKey:@"images"] valueForKey:@"small"]];
                [self.movieView.cell.zeroSectionScroll.twoButton sd_setBackgroundImageWithURL:url1 forState:UIControlStateNormal];
            stringM = [futureModel.subjects[1] valueForKey:@"mainland_pubdate"];
            stringM = [stringM substringWithRange:NSMakeRange(5, 2)];
            stringD = [futureModel.subjects[1] valueForKey:@"mainland_pubdate"];
            stringD = [stringD substringWithRange:NSMakeRange(8, 2)];
        self.movieView.cell.zeroSectionScroll.twoButton.dataLabel.text = [NSString stringWithFormat:@"%@月%@日",stringM, stringD];
           self.movieView.cell.zeroSectionScroll.twoButton.ID = [futureModel.subjects[1] valueForKey:@"ID"];
            
            
            self.movieView.cell.zeroSectionScroll.threeButton.label.text = [futureModel.subjects[2] valueForKey:@"title"];
            NSURL *url2 = [NSURL URLWithString:[[futureModel.subjects[2] valueForKey:@"images"] valueForKey:@"small"]];
                [self.movieView.cell.zeroSectionScroll.threeButton sd_setBackgroundImageWithURL:url2 forState:UIControlStateNormal];
            stringM = [futureModel.subjects[0] valueForKey:@"mainland_pubdate"];
            stringM = [stringM substringWithRange:NSMakeRange(5, 2)];
            stringD = [futureModel.subjects[0] valueForKey:@"mainland_pubdate"];
            stringD = [stringD substringWithRange:NSMakeRange(8, 2)];
    self.movieView.cell.zeroSectionScroll.threeButton.dataLabel.text = [NSString stringWithFormat:@"%@月%@日",stringM, stringD];
            self.movieView.cell.zeroSectionScroll.threeButton.ID = [futureModel.subjects[2] valueForKey:@"ID"];;
            
            
                
            self.movieView.cell.zeroSectionScroll.fourButton.label.text = [futureModel.subjects[3] valueForKey:@"title"];
            NSURL *url3 = [NSURL URLWithString:[[futureModel.subjects[3] valueForKey:@"images"] valueForKey:@"small"]];
                [self.movieView.cell.zeroSectionScroll.fourButton sd_setBackgroundImageWithURL:url3 forState:UIControlStateNormal];
            stringM = [futureModel.subjects[3] valueForKey:@"mainland_pubdate"];
            stringM = [stringM substringWithRange:NSMakeRange(5, 2)];
            stringD = [futureModel.subjects[3] valueForKey:@"mainland_pubdate"];
            stringD = [stringD substringWithRange:NSMakeRange(8, 2)];
            self.movieView.cell.zeroSectionScroll.fourButton.dataLabel.text = [NSString stringWithFormat:@"%@月%@日",stringM, stringD];
            self.movieView.cell.zeroSectionScroll.fourButton.ID = [futureModel.subjects[3] valueForKey:@"ID"];;
                
            
            
            self.movieView.cell.zeroSectionScroll.fiveButton.label.text = [futureModel.subjects[4] valueForKey:@"title"];
                NSURL *url4 = [NSURL URLWithString:[[futureModel.subjects[4] valueForKey:@"images"] valueForKey:@"small"]];
                [self.movieView.cell.zeroSectionScroll.fiveButton sd_setBackgroundImageWithURL:url4 forState:UIControlStateNormal];
            stringM = [futureModel.subjects[4] valueForKey:@"mainland_pubdate"];
            stringM = [stringM substringWithRange:NSMakeRange(5, 2)];
            stringD = [futureModel.subjects[4] valueForKey:@"mainland_pubdate"];
            stringD = [stringD substringWithRange:NSMakeRange(8, 2)];
        self.movieView.cell.zeroSectionScroll.fiveButton.dataLabel.text = [NSString stringWithFormat:@"%@月%@日",stringM, stringD];
            self.movieView.cell.zeroSectionScroll.fiveButton.ID = [futureModel.subjects[4] valueForKey:@"ID"];;
            
            
            
            self.movieView.cell.zeroSectionScroll.sixButton.label.text = [futureModel.subjects[5] valueForKey:@"title"];
                NSURL *url5 = [NSURL URLWithString:[[futureModel.subjects[5] valueForKey:@"images"] valueForKey:@"small"]];
                [self.movieView.cell.zeroSectionScroll.sixButton sd_setBackgroundImageWithURL:url5 forState:UIControlStateNormal];
            stringM = [futureModel.subjects[5] valueForKey:@"mainland_pubdate"];
            stringM = [stringM substringWithRange:NSMakeRange(5, 2)];
            stringD = [futureModel.subjects[5] valueForKey:@"mainland_pubdate"];
            stringD = [stringD substringWithRange:NSMakeRange(8, 2)];
        self.movieView.cell.zeroSectionScroll.sixButton.dataLabel.text = [NSString stringWithFormat:@"%@月%@日",stringM, stringD];
            self.movieView.cell.zeroSectionScroll.sixButton.ID = [futureModel.subjects[5] valueForKey:@"ID"];;

        });
    
    
    }error:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
}
- (BOOL)changeStar:(DBDBaseButton *)button Score:(NSString *)number {
    if ([number  isEqual: @"00"]) {
        button.scoreLabel.text = @"";
        button.tempLabel.text = @"尚未上映";
        return NO;
    } else if ([number  isEqual: @"10"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"15"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"20"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"25"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"30"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"35"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"40"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"star.png"]];
        return YES;
    } else if ([number  isEqual: @"45"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"starHalf.png"]];
        return YES;
    } else if ([number  isEqual: @"50"]) {
        [button.oneStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.twoStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.threeStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fourStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        [button.fiveStarImageView setImage:[UIImage imageNamed:@"starAll.png"]];
        return YES;
    } else {
        return NO;
    }
}
- (void)movieBtn:(NSNotification *)noti {
    DBDBaseButton *button = [noti object];
    DBDEveryMovieViewController *every = [[DBDEveryMovieViewController alloc] init];
    every.ID = [button.ID mutableCopy];
    SOZOChromoplast *color = [[SOZOChromoplast alloc] initWithImage:[button currentBackgroundImage]];
    every.colorMutArray = [[NSMutableArray alloc] init];
    [every.colorMutArray addObject:color];
    //every.title = @"电影";
    [self.navigationController pushViewController:every animated:NO];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"clickBtn" object:nil];
}



@end
