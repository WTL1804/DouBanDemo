//
//  HomeView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDHomeView.h"
#import "TableViewCell.h"

@implementation DBDHomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor blackColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 1.25 / 7, self.frame.size.width, self.frame.size.height - self.frame.size.height * 1.25 / 7) style:UITableViewStyleGrouped];
    //[self addSubview:self.tableView];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.backgroundColor = [UIColor whiteColor];
    self.mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 1.25 / 7, self.frame.size.width, self.frame.size.height - self.frame.size.height * 1.25 / 7)];
    [self addSubview:self.mainScroll];
    self.mainScroll.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"123.JPG"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
    imageView.image = image;
    [self.mainScroll addSubview:imageView];
    self.mainScroll.pagingEnabled = YES;
    self.mainScroll.contentSize = CGSizeMake(self.frame.size.width * 2, 0);    
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"WTLCell" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.frame.size.height/2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return nil;
//}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    NSLog(@"%f",self.mainScroll.contentOffset.x);
//}

@end
