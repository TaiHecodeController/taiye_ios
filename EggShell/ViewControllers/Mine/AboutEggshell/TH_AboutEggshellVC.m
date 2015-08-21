//
//  TH_AboutEggshellVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/13.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_AboutEggshellVC.h"
@interface TH_AboutEggshellVC ()
@property(nonatomic,strong)UIScrollView * scro;
@property(strong,nonatomic)UIWebView* webView;
@end

@implementation TH_AboutEggshellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    AboutEggerView * aboutView = [[[NSBundle mainBundle] loadNibNamed:@"AboutEgger" owner:self options:nil] lastObject];
//    aboutView.frame = CGRectMake(0, 0, WIDETH, HEIGHT);
//    [self.view addSubview:aboutView];
    UIScrollView * scro = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT)];
    [self.view addSubview:scro];
    
    self.scro = scro;
    
    [self createLogo];
}
-(void)createLogo{

    UIImageView * imageView  = [[UIImageView alloc] initWithFrame:CGRectMake((WIDETH-72)/2.0, 15, 72, 90)];
    imageView.image = [UIImage imageNamed:@"logo"];
    [self.scro addSubview:imageView];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"蛋壳儿" ofType:@"doc"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(-45, 105, WIDETH+90, HEIGHT-120-10-10)];
    
    self.webView.scrollView.bounces = NO;
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.webView.scalesPageToFit = YES;
    [self.scro addSubview:self.webView];
    self.scro.contentSize = CGSizeMake(WIDETH, 105+self.webView.frame.size.height+100);
    

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
