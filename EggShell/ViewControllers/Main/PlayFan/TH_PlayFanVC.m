//
//  TH_PlayFanVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/13.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_PlayFanVC.h"
#import "InformationDeskCell.h"
#import "HYSegmentedControl.h"
#import "TH_InformationDeskDetailVC.h"
@interface TH_PlayFanVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property (nonatomic, strong) HYSegmentedControl *segmentedControl;
@property (nonatomic, assign) int currentIndex;
@end

@implementation TH_PlayFanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"玩出范";
    [self createView];
    [self createTbleView];
    [self hySegmentedControlSelectAtIndex:0];

    // Do any additional setup after loading the view.
}
-(void)createView
{
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, WIDETH, 0.5)];
    bgView.backgroundColor = color(221, 221, 221);
    [self.view addSubview:bgView];
    NSArray *iconArr = @[@[@"high1",@"high"],@[@"fuli",@"fuli1"]];
    
    
    
    _segmentedControl = [[HYSegmentedControl alloc] initWithOriginY:0 Titles:@[@"蛋粉H翻天igh", @"蛋壳儿送福利"]  IconNames:iconArr delegate:self] ;
    [self.view addSubview:_segmentedControl];
    
}
- (void)hySegmentedControlSelectAtIndex:(NSInteger)index
{
    if (index == 0)
    {
        
        _currentIndex = 0;
        NSLog(@"蛋粉H翻天igh");
        
        
        [self.tableView reloadData];
       
    }
    else
    {
        _currentIndex = 1;
        NSLog(@"蛋壳儿送福利");
       
        
        [self.tableView reloadData];
        
    }
}
-(void)createTbleView{

    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, WIDETH, HEIGHT-40-49) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformationDeskCell* InforCell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!InforCell) {
        InforCell = [[[NSBundle mainBundle] loadNibNamed:@"InformationDeskCell" owner:self options:nil] lastObject];
    }
    return InforCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    TH_InformationDeskDetailVC * detail = [[TH_InformationDeskDetailVC alloc] init];
    detail.title = @"详情";
    [self.navigationController pushViewController:detail animated:YES];
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
