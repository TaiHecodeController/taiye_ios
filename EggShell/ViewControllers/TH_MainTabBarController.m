//
//  TH_MainTabBarController.m
//  EggShell
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_MainTabBarController.h"
#import "TH_MainViewController.h"
#import "TH_ActivityViewController.h"
#import "TH_ClassViewController.h"
#import "TH_MineViewController.h"

@interface TH_MainTabBarController ()

@end

@implementation TH_MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewcontrollers];
    [self createTabBarItems];
    // Do any additional setup after loading the view.
}

-(void)createViewcontrollers
{
    TH_MainViewController * main_vc = [[TH_MainViewController alloc] init];
    main_vc.view.backgroundColor = [UIColor redColor];
    TH_ActivityViewController * acti_vc = [[TH_ActivityViewController alloc] init];
    TH_ClassViewController * class_vc = [[TH_ClassViewController alloc] init];
    TH_MineViewController * mine_vc = [[TH_MineViewController alloc] init];
    self.viewControllers = @[main_vc,acti_vc,class_vc,mine_vc];
    
}

-(void)createTabBarItems
{
    self.tabBar.backgroundColor = [UIColor greenColor];
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
