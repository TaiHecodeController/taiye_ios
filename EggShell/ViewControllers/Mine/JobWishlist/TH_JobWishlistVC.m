//
//  TH_JobWishlistVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/12.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_JobWishlistVC.h"
#import "JobWishlistCell.h"
@interface TH_JobWishlistVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;

@end

@implementation TH_JobWishlistVC

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"收藏职位";
    [self createTableView];
}
-(void)createTableView
{
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT-49) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    tableView.showsVerticalScrollIndicator = NO;
   tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JobWishlistCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [JobWishlistCell RegisterJobWishListCell];
    }
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;

}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 43)];
    view.backgroundColor = color(255, 255, 255);
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(WIDETH-50, 15, 40, 13)];
    lable.text= @"15条记录";
    lable.font = [UIFont systemFontOfSize:13];
    lable.textColor = [UIColor blackColor];
    [view addSubview:lable];
    
    return view;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"ksdfia";

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 43;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
