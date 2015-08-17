//
//  TH_FeedBackVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/17.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_FeedBackVC.h"

@interface TH_FeedBackVC ()

@end

@implementation TH_FeedBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF3F3F1);
    
    [self createTextView];
    }

-(void)createTextView{

    
    UIView * View =[[UIView alloc] initWithFrame:CGRectMake(30, 30, WIDETH-60, 160)];
    View.backgroundColor = [UIColor whiteColor];
    View.layer.cornerRadius = 3;
    View.layer.masksToBounds = YES;
    View.layer.borderWidth = 0.5;
    View.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
    [self.view addSubview:View];
    UITextView * textView =[[UITextView alloc] initWithFrame:CGRectMake(5, 5, View.width-50, 150)];
    textView.text = @"请留下你的宝贵意见，我们会尽快处理...";
    textView.font =[UIFont systemFontOfSize:12];
    textView.textColor  = UIColorFromRGB(0xC8C8C8);
    [View addSubview:textView];
    /*留下联系方式**/
    UILabel * ContactTextLable = [[UILabel alloc]
                                  initWithFrame:CGRectMake(30, 215, WIDETH-60, 12)];
    ContactTextLable.text = @"留下你的联络方式，方便我们与你取得联系";
    ContactTextLable.textColor = UIColorFromRGB(0x323232);
    ContactTextLable.font =[UIFont systemFontOfSize:12];
    [self.view addSubview:ContactTextLable];
    
    /*qq号码**/
    UITextField *qqTextField =[[UITextField alloc] initWithFrame:CGRectMake(30, 237, WIDETH-60, 35)];
    qqTextField.placeholder = @"QQ号码";
    qqTextField.textColor = UIColorFromRGB(0xC8C8C8);
    qqTextField.font = [UIFont systemFontOfSize:12];
    qqTextField.layer.borderWidth = 0.5;
    qqTextField.layer.cornerRadius = 3;
    qqTextField.layer.masksToBounds = YES;
    qqTextField.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
    [self.view addSubview:qqTextField];
    
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
