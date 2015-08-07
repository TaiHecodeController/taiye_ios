//
//  MainViewController.m
//  EggShell
//
//  Created by mac on 15/8/7.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_MainViewController.h"


@interface TH_MainViewController ()<UIScrollViewDelegate>
{
    UIView * _navBackView;
}

@end

@implementation TH_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITextField * searchField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
//    searchField.background = [UIImage imageNamed:@"bg_new.png"];
//    [self.view addSubview:searchField];
    [self createNav];
    UINavigationBar * bar = self.navigationController.navigationBar;
    [self getBackView:bar];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    scrollView.contentSize = CGSizeMake(320, 800);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)createNav
{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _navBackView.alpha = scrollView.contentOffset.y / 500;
    
}

-(void)getBackView:(UIView *)superView
{
    if([superView isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
    {
        _navBackView = superView;
        //设置背景色
        _navBackView.backgroundColor = [UIColor redColor];
        _navBackView.alpha = 0.0;
        ;
        
    }else if([superView isKindOfClass:NSClassFromString(@"_UIBackdropView")])
    {
        superView.hidden = YES;
    }
    
    for(UIView * view in superView.subviews)
    {
        [self getBackView:view];
    }
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
