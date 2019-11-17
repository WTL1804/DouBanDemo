//
//  DBDEveryMovieViewController.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/11/2.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDEveryMovieViewController.h"
#import "DBDManager.h"
#import <UIImageView+WebCache.h>
#import <SOZOChromoplast.h>
#import <UIButton+WebCache.h>
@interface DBDEveryMovieViewController ()

@end

@implementation DBDEveryMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mainView = [[DBDEveryMovieView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
   
    //UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    UIButton *barButton = [[UIButton alloc] init];
    [barButton setTitle:@"<" forState:UIControlStateNormal];
    [barButton addTarget:self action:@selector(pressLeft) forControlEvents:UIControlEventTouchUpInside];
    [barButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    barButton.titleLabel.font = [UIFont systemFontOfSize:25];
   UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    
     

    UIButton *barButtonTwo = [[UIButton alloc] init];
    [barButtonTwo setTitle:@"" forState:UIControlStateNormal];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:barButtonTwo];
    [barButtonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *barButtonThree = [[UIButton alloc] init];
    [barButtonThree setTitle:@"电影" forState:UIControlStateNormal];
     [barButtonThree setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _item3 = [[UIBarButtonItem alloc] initWithCustomView:barButtonThree];
    [self.navigationController.navigationBar addSubview:barButtonThree];
    
    
    DBDNavigationStarButton *navStarBtn = [DBDNavigationStarButton buttonWithType:UIButtonTypeCustom];
    _itemImageBtn = [[UIBarButtonItem alloc] initWithCustomView:navStarBtn];
    navStarBtn.frame = CGRectMake(0, 0, 110,80);
    
    
    UIBarButtonItem*item5 = [[UIBarButtonItem alloc] initWithTitle:@"       " style:UIBarButtonItemStylePlain target:self action:nil];
    
    NSArray *array = [NSArray arrayWithObjects:item,_itemImageBtn,_item3,item5, nil];
    
    self.navigationItem.leftBarButtonItems = array;
    [self.view addSubview:_mainView];
    [_mainView setUI];
//    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:NULL style:UIBarButtonItemStylePlain target:self action:nil];
    SOZOChromoplast *color = _colorMutArray[0];
    self.mainView.backgroundColor = color.firstHighlight;
    self.mainView.mainScroll.backgroundColor = color.firstHighlight;
    self.mainView.mainScroll.delegate = self;
    [self NetWork];
}
- (void)NetWork {
    [[DBDManager sharedLeton] netWorkOfEveryMovieWithID:self.ID success:^(DBDEveryMovieModel *movieModel){
        dispatch_async(dispatch_get_main_queue(), ^{
            self.mainView.titleLabel.text = movieModel.title;
            [self.mainView.movieImageView sd_setImageWithURL:[movieModel.images valueForKey:@"small"]];
            
            if (![movieModel.original_title isEqualToString:movieModel.title]) {
                self.mainView.originalTitleLabel.text = movieModel.original_title;
            } else {
                self.mainView.originalTitleLabel.text = [NSString stringWithFormat:@"(%@)",movieModel.year];
            }
            NSArray *array = movieModel.countries;
            NSMutableString *tempString = [[NSMutableString alloc] init];
            NSString *string = [[NSString alloc] init];
            for (int i = 0; i < array.count; i++) {
                if (i <array.count - 1) {
                    string = [NSString stringWithFormat:@"%@ ",array[i]];
                    [tempString appendString:string];
                } else {
                    string = [NSString stringWithFormat:@"%@/",array[i]];
                    [tempString appendString:string];
                }
            }
            array = movieModel.genres;
            for (int i = 0; i < array.count; i++) {
                if (i <array.count - 1) {
                    string = [NSString stringWithFormat:@"%@ ",array[i]];
                    [tempString appendString:string];
                } else {
                    string = [NSString stringWithFormat:@"%@/",array[i]];
                    [tempString appendString:string];
                }
            }
            array = movieModel.pubdates;
            if (array.count > 1) {
                [tempString appendFormat:@"%@上映/",array[array.count - 1]];
            } else {
                [tempString appendFormat:@"%@上映/",array[0]];
            }
            array = movieModel.durations;
            for (int i = 0; i < array.count; i++) {
                string = [NSString stringWithFormat:@"片长%@/",array[i]];
                [tempString appendString:string];
                
            }
            [tempString appendString:@">"];
            self.mainView.descriptionLabel.text = tempString;
            
            [self changeStar:self.mainView.starButton Score:[movieModel.rating valueForKey:@"stars"]];
            
            
            self.mainView.scriptCell.plotLabel.text = movieModel.summary;
          
            NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};//指定字号
                CGRect rect = [movieModel.summary boundingRectWithSize:CGSizeMake(375, 0)/*计算高度要先指定宽度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                               NSStringDrawingUsesFontLeading attributes:dic context:nil];
            self.mainView.heightOfText = rect.size.height;
            
            if (![[movieModel.rating valueForKey:@"stars"] isEqual: @"00"]) {
            
                
               NSString *stringTemp = [movieModel.rating valueForKey:@"average"];
                stringTemp = [stringTemp substringToIndex:3];
                self.mainView.starButton.scoreLabel.text = stringTemp;
                
                
                tempString = [NSMutableString stringWithFormat:@"%@人看过  ",movieModel.collect_count];
                 [tempString appendString:[NSString stringWithFormat:@"%@人想看",movieModel.wish_count]];
                self.mainView.peopleLabel.text = tempString;
                self.mainView.peopleHasScoreLabel.text =[NSString stringWithFormat:@"%@人已评分", movieModel.ratings_count];
                
                double sum = [movieModel.rating.details.five doubleValue] + [movieModel.rating.details.four doubleValue] + [movieModel.rating.details.three doubleValue] + [movieModel.rating.details.two doubleValue] + [movieModel.rating.details.one doubleValue];
                
                self.mainView.progressViewFive.progress = [movieModel.rating.details.five doubleValue] /sum;
               
                self.mainView.progressViewFour.progress = [movieModel.rating.details.four doubleValue] /sum;
                            
                self.mainView.progressViewThree.progress = [movieModel.rating.details.three doubleValue] /sum;
                
                self.mainView.progressViewTwo.progress = [movieModel.rating.details.two doubleValue] /sum;
                
                self.mainView.progressViewOne.progress = [movieModel.rating.details.one doubleValue] /sum;
                
                DBDNavigationStarButton *button = self.itemImageBtn.customView;
                NSURL *imageUrl = [NSURL URLWithString:movieModel.images.small];
                [button sd_setImageWithURL:imageUrl forState:UIControlStateNormal];
                [button setTitle:movieModel.title forState:UIControlStateNormal];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self changeStarNavigate:button Score:movieModel.rating.stars];
                button.scoreLabel.text = movieModel.rating.average;
                button.titleLabel.font = [UIFont systemFontOfSize:15];
                button.alpha = 0;
               
            } else {
                self.mainView.wantLabel.text = [NSString stringWithFormat:@"%@人想看", movieModel.wish_count];
                self.mainView.noViewLabel.text = @"尚未上映";
                
                DBDNavigationStarButton *button = self.itemImageBtn.customView;
                NSURL *imageUrl = [NSURL URLWithString:movieModel.images.small];
                [button sd_setImageWithURL:imageUrl forState:UIControlStateNormal];
                [button setTitle:movieModel.title forState:UIControlStateNormal];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:15];
                button.alpha = 0;
                for (int i = 1000; i < 15 + 1000; i++) {
                        UIImageView *imageViewStar = [self.mainView.backgroundImage viewWithTag:i];
                        imageViewStar.alpha = 0;
                    
                }
                self.mainView.progressViewOne.alpha = 0;
                self.mainView.progressViewTwo.alpha = 0;
                self.mainView.progressViewThree.alpha = 0;
                self.mainView.progressViewFour.alpha = 0;
                self.mainView.progressViewFive.alpha = 0;
            }
            //请求短评
            self.mainView.shortCommentMutArray = [[NSMutableArray alloc] init];
            self.mainView.heightOfCommentMutArray = [[NSMutableArray alloc] init]; 
            for (int i = 0; i < 4; i++) {
                [self.mainView.shortCommentMutArray addObject:[movieModel.popular_comments[i] valueForKey:@"content"]];
            
            NSDictionary *dic2 = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};//指定字号
            CGRect rect2 = [[movieModel.popular_comments[i] valueForKey:@"content"] boundingRectWithSize:CGSizeMake(375, 0)/*计算高度要先指定宽度*/ options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic2 context:nil];
                NSNumber *f = [NSNumber numberWithFloat:rect2.size.height];
                [self.mainView.heightOfCommentMutArray addObject:f];
            }
            
            
            [self.mainView.shortCommentTableView reloadData];
            
            
        });
    } error:^(NSError *error) {
        
        NSLog(@"请求失败");
    }];
    //请求剧照
    [[DBDManager sharedLeton] everyMoviewImagesWithID:self.ID success:^(DBDEveryMovieImagesModel *everyMovieImagesModel) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.mainView.imagesUrl = [[NSMutableArray alloc] init];
            for (int i = 0; i < 6; i++) {
                [self.mainView.imagesUrl addObject:[everyMovieImagesModel.photos[i] valueForKey:@"thumb"]];
                [self.mainView.scriptTableView reloadData];
            }
        });
    }error:^(NSError *error) {
        NSLog(@"请求失败");
    }];

    
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBar
    
    
}
- (void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = YES;
}
- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:NO];
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
    CGFloat y = scrollView.contentOffset.y;
    if (y > 100) {
        _item3.customView.alpha = 0;
        _itemImageBtn.customView.alpha = 1;
    }
    if (y < 100) {
          _item3.customView.alpha = 1 - y * 0.1;
            _itemImageBtn.customView.alpha = y*0.1;
    }
}

- (BOOL)changeStar:(DBDEveryStarButton *)button Score:(NSString *)number {
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
- (BOOL)changeStarNavigate:(DBDNavigationStarButton *)button Score:(NSString *)number {
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


@end
