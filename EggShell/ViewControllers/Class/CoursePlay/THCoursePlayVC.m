//
//  THCoursePlayVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/11.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "THCoursePlayVC.h"
#import "Course PlayCell.h"
#import "CourePlayTitle.h"
@interface THCoursePlayVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;


@end

@implementation THCoursePlayVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程播放";
    [self createCourePlay];
    [self createTableView];
    // Do any additional setup after loading the view.
}
-(void)createCourePlay
{

    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 211)];
    
    bgImageView.image =[UIImage imageNamed:@"shipinchuangkou"];
    [self.view addSubview:bgImageView];
}
-(void)createTableView
{

    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 211, WIDETH, HEIGHT - 211-64) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Course_PlayCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Course PlayCell" owner:self options:nil] lastObject];
    }
    
    [cell setOrderValue:(int)indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CourePlayTitle * coureTitle = [[[NSBundle mainBundle] loadNibNamed:@"CourePlaytitle" owner:self options:nil] lastObject];
    return coureTitle;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 66;
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
