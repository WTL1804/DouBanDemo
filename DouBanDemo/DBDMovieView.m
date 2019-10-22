//
//  DBDMovieView.m
//  DouBanDemo
//
//  Created by 王天亮 on 2019/10/9.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "DBDMovieView.h"
#import "TableViewCell.h"
@implementation DBDMovieView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    
    
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 1.25 / 7, self.frame.size.width, self.frame.size.height - self.frame.size.height * 1.25 / 7 - 88)];
    [self addSubview:self.mainScrollView];
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.contentSize = CGSizeMake(self.frame.size.width * 6, 0);
//    self.overAlltableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 1.25 / 7, self.frame.size.width, self.frame.size.height - self.frame.size.height * 1.25 / 7) style:UITableViewStyleGrouped];
    self.overAlltableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - self.frame.size.height * 1.25 / 7) style:UITableViewStyleGrouped];
       [self.overAlltableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCell3"];
       [self.overAlltableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"WTLCell4"];
       self.overAlltableView.delegate = self;
       self.overAlltableView.dataSource = self;
    self.overAlltableView.backgroundColor = [UIColor whiteColor];
    self.overAlltableView.tag = 202;
    [self.mainScrollView addSubview:self.overAlltableView];
    self.overAlltableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        if (indexPath.section == 0) {
        TableViewCell *cell = [self.overAlltableView dequeueReusableCellWithIdentifier:@"WTLCell3" forIndexPath:indexPath];
            cell.cellDelegate = self;

        cell.backgroundColor = [UIColor whiteColor];
        return cell;
        } else {
            TableViewCell *cell = [self.overAlltableView dequeueReusableCellWithIdentifier:@"WTLCell4" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
            return cell;
        }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.frame.size.height - self.frame.size.height * 1.25 / 7 - self.frame.size.height * 2 / 9);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (void)clickBtn{
    [self.tableViewDelegate clickCellButton];
}

@end
