//
//  TH_FindJobVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/8.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_FindJobVC.h"
#import "TH_JobDetailVC.h"
@interface TH_FindJobVC ()

@end

@implementation TH_FindJobVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn =[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 111)];
    [btn addTarget:self action:@selector(bb) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor =[UIColor grayColor];
    [self.view addSubview:btn];
        self.title = @"全职职位";
}
-(void)bb
{
    TH_JobDetailVC * job = [[TH_JobDetailVC alloc] init];
    [self.navigationController pushViewController:job animated:YES];
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
