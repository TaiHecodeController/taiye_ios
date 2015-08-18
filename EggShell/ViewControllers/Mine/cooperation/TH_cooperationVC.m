//
//  TH_cooperationVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/17.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_cooperationVC.h"

@interface TH_cooperationVC ()

@end

@implementation TH_cooperationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"合作渠道";
    UIScrollView * scro = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT)];
    [self.view addSubview:scro];
    scro.showsVerticalScrollIndicator = NO;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, WIDETH-30, 390)];
    imageView.image = [UIImage  imageNamed:@"logotu"];
    [scro addSubview:imageView];
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake((WIDETH-187)/2.0,480, 187, 11)];
    lable.text = @"太和天下投资控股有限公司 版权所有" ;
    lable.textColor = UIColorFromRGB(0x646464);
    lable.font =[UIFont systemFontOfSize:11];
    [scro addSubview:lable];
    scro.contentSize = CGSizeMake(WIDETH, 580);
    
   
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