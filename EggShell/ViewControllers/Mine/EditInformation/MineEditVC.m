//
//  MineEditVC.m
//  EggShell
//
//  Created by mac on 15/8/12.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "MineEditVC.h"
#import "MineEditInfoView.h"
#import "EditAddressVC.h"

@interface MineEditVC ()
{
    MineEditInfoView * EdView;
    UITapGestureRecognizer * cityTapGes;
}

@end

@implementation MineEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    EdView = [[[NSBundle mainBundle] loadNibNamed:@"MineEditInfoView" owner:self options:nil] firstObject];
    EdView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:EdView];
    EdView.contentSize = CGSizeMake(WIDETH / 2, HEIGHT + 60);
    [self createNav];
    // Do any additional setup after loading the view.
}

-(void)createNav
{
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBtn setTitle:@"保存" forState:UIControlStateSelected];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

-(void)rightClick:(UIButton *)sender
{
    if(!sender.isSelected)
    {
        //编辑
        EdView.name.editable = YES;
        EdView.name.tag = 100;
        EdView.sex.editable = YES;
        EdView.sex.tag = 101;
        cityTapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cityTap)];
        [EdView.city addGestureRecognizer:cityTapGes];
        EdView.city.tag = 102;
        EdView.Introduce.editable = YES;
        EdView.Introduce.tag = 103;
        EdView.birthDay.editable = YES;
        EdView.birthDay.tag = 104;
        EdView.email.editable = YES;
        EdView.email.tag = 105;
        EdView.QQNum.editable = YES;
        EdView.QQNum.tag = 106;
        sender.selected = !sender.selected;
    }else
    {
        //保存
        EdView.name.editable = NO;
        EdView.sex.editable = NO;
        [EdView.city removeGestureRecognizer:cityTapGes];
        EdView.Introduce.editable = NO;
        EdView.birthDay.editable = NO;
        EdView.email.editable = NO;
        EdView.QQNum.editable = NO;
        sender.selected = !sender.selected;
        
        
    }
    
    
}

-(void)cityTap
{
    EditAddressVC * eavc = [[EditAddressVC alloc] init];
    [self.navigationController pushViewController:eavc animated:YES];
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
