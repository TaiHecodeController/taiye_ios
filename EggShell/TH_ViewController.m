//
//  ViewController.m
//  EggShell
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_ViewController.h"
#import "LoginAndRegisterRequest.h"

@interface TH_ViewController ()

@end

@implementation TH_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [LoginAndRegisterRequest registerWithSucc:^(NSDictionary *DataDic) {
//        
//    } WithUserName:@"wsdwsd" WithPassword:@"wsd2023243" WithUserType:1 WithSource:6 WithPhoneNum:@"13522272537" WithEmail:@"272535439@qq.com"];
    [LoginAndRegisterRequest loginWithSucc:^(NSDictionary *DataDic) {
        
    } WithUserName:@"wsdwsd" WithPassword:@"wsd2023243"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
