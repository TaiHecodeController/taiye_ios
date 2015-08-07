//
//  MainViewController.m
//  EggShell
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_MainViewController.h"

@interface TH_MainViewController ()

@end

@implementation TH_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField * searchField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
    searchField.background = [UIImage imageNamed:@"bg_new.png"];
    [self.view addSubview:searchField];
    // Do any additional setup after loading the view from its nib.
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
