//
//  TH_LoginVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/12.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_LoginVC.h"
#import "LoginView.h"
#import "TH_RegisterVC.h"
#import "TH_ForgotPasswordVC.h"
#import "AppDelegate.h"
#import "TH_HomeVC.h"
@interface TH_LoginVC ()

@end

@implementation TH_LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self loginView];
    // Do any additional setup after loading the view.
}
-(void)loginView
{
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 110)];
    bgView.backgroundColor = color(243, 243, 241);
    [self.view addSubview:bgView];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((WIDETH-55)/2.0, 15, 55, 77)];
    imageView.image = [UIImage imageNamed:@"logo"];
    [bgView addSubview:imageView];
    
    UIView * loginView = [[UIView alloc] initWithFrame:CGRectMake(0, 110, WIDETH, 90)];
    [self.view addSubview:loginView];
    UIView * linefirstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 0.5)];
    linefirstView.backgroundColor = color(221, 221, 221);
    [loginView addSubview:linefirstView];
   UIView * loginSencondView = [[UIView alloc] initWithFrame:CGRectMake(15, 45, WIDETH, 0.5)];
   loginSencondView.backgroundColor =color(221, 221, 221);
    [loginView addSubview:loginSencondView];
    
    UIView * loginThreeView = [[UIView alloc] initWithFrame:CGRectMake(0, 89.5, WIDETH, 0.5)];
    loginThreeView
    .backgroundColor = color(221, 221, 221);
    [loginView addSubview:loginThreeView];
    
    
    UILabel * phoneLable = [[UILabel alloc] initWithFrame:CGRectMake(15, 16, 45, 15)];
    phoneLable.text = @"手机号";
    phoneLable.textColor = [UIColor blackColor];
    phoneLable.font = [UIFont systemFontOfSize:15];
    [loginView addSubview:phoneLable];
    
    UILabel * passwordLable = [[UILabel alloc] initWithFrame:CGRectMake(15, 16+45, 40, 15)];
    passwordLable.text = @"密码";
    passwordLable.font = [UIFont systemFontOfSize:15];
    [loginView addSubview:passwordLable];
    
    
    UITextField * phonetextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 0, WIDETH - 80, 45)];
   phonetextField.placeholder = @"请输入手机号码";
    phonetextField.textColor = color(200, 200, 200);
    phonetextField.font = [UIFont systemFontOfSize:13];
    [loginView addSubview:phonetextField];
    
    UITextField * passwordTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(80, 45, WIDETH - 80, 45)];
    passwordTextFiled.placeholder =  @"请输入密码";
    passwordTextFiled.font =[UIFont systemFontOfSize:13];
    passwordTextFiled.textColor = color(200, 200, 200);
    [loginView addSubview:passwordTextFiled];
    
    //登录
    UIButton * loginBtn =[[UIButton alloc] initWithFrame:CGRectMake(15, 215, WIDETH - 30, 45)];
   
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"hongniu"] forState:UIControlStateNormal];
    loginBtn.titleLabel.textColor = color(255, 255, 255);
    [loginBtn addTarget:self action:@selector(loginBtbClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UILabel * registerLable = [[UILabel alloc] initWithFrame:CGRectMake(15, 275, 70, 12)];
    registerLable.text = @"还没有账号?";
    registerLable.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:registerLable];
    UIButton * registBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 275, 60, 12)];
    [registBtn addTarget:self action:@selector(registClick) forControlEvents:UIControlEventTouchUpInside];
    [registBtn setTitle:@"立即注册!" forState:UIControlStateNormal];
    [registBtn setTitleColor:color(244, 67, 54) forState:UIControlStateNormal];
    registBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:registBtn];
    
    //忘记密码
    UIButton * forgetBtn =[[UIButton alloc] initWithFrame:CGRectMake(WIDETH-70, 275, 55, 12)];
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:color(244, 67, 54) forState:UIControlStateNormal];
    forgetBtn.titleLabel.font =[UIFont systemFontOfSize:12];
    [forgetBtn addTarget:self action:@selector(ForgotPasswordClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    
    
    
}
-(void)loginBtbClick
{
    NSLog(@"登录");
    self.navigationController.navigationBarHidden = YES;
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.mainTabBar = [[TH_MainTabBarController alloc] init];

    appDelegate.mainTabBar.modalTransitionStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.mainTabBar animated:YES completion:nil];
}
-(void)ForgotPasswordClick
{
    TH_ForgotPasswordVC * forgot = [[TH_ForgotPasswordVC alloc] init];
    forgot.title = @"找回密码";
    [self.navigationController pushViewController:forgot animated:YES];
}
-(void)registClick
{
    TH_RegisterVC * regist = [[TH_RegisterVC alloc] init];
    regist.title = @"注册";
    [self.navigationController pushViewController:regist animated:YES];
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
