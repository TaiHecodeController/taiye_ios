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
    UINavigationController * nc1 = [[UINavigationController alloc] initWithRootViewController:main_vc];
    
    TH_ActivityViewController * acti_vc = [[TH_ActivityViewController alloc] init];
    UINavigationController * nc2 = [[UINavigationController alloc] initWithRootViewController:acti_vc];
    
    TH_ClassViewController * class_vc = [[TH_ClassViewController alloc] init];
    UINavigationController * nc3 = [[UINavigationController alloc] initWithRootViewController:class_vc];
    
    TH_MineViewController * mine_vc = [[TH_MineViewController alloc] init];
    UINavigationController * nc4 = [[UINavigationController alloc] initWithRootViewController:mine_vc];
    
    self.viewControllers = @[nc1,nc2,nc3,nc4];
    [self createTabBarItems];
    
}

-(void)createTabBarItems
{
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateSelected];
    NSArray * titleArray = @[@"首页",@"玩出范",@"公开课",@"我的"];
    NSArray * unSelectArray = @[@"home", @"wanchufan", @"gongkaike00",@"wode"];
    NSArray * selectArray = @[@"home01",@"wanchufan01",@"gongkaike01",@"wode01"];
    
    NSArray * items = self.tabBar.items;
    for(int i = 0;i < items.count;i++)
    {
        UITabBarItem * item = items[i];
        item = [items[i] initWithTitle:titleArray[i] image:[UIImage imageNamed:selectArray[i]] selectedImage:[UIImage imageNamed:unSelectArray[i]]];
        
    }
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"矩形-8-拷贝-3"];
    
    
    
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
