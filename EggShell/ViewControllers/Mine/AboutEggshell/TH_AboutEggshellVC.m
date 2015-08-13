//
//  TH_AboutEggshellVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/13.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_AboutEggshellVC.h"
#import "AboutEggerView.h"
@interface TH_AboutEggshellVC ()

@end

@implementation TH_AboutEggshellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AboutEggerView * aboutView = [[[NSBundle mainBundle] loadNibNamed:@"AboutEgger" owner:self options:nil] lastObject];
    aboutView.frame = CGRectMake(0, 0, WIDETH, HEIGHT);
    [self.view addSubview:aboutView];
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
