//
//  TH_MineVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/8.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_MineVC.h"
#import "MineVeiw.h"
#import "MineEditVC.h"
#import "TH_DeliveryJobVC.h"
#import "TH_JobWishlistVC.h"
@interface TH_MineVC ()<THMineViewDelegate>
@property(nonatomic,strong)UIScrollView * scro;
@end

@implementation TH_MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(243, 243, 243);
    self.title = @"我的";
    [self createScro];
    [self createView];
    }
-(void)createScro
{
    UIScrollView * sro = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT-49)];
    [self.view addSubview:sro];
    self.scro = sro;
    self.scro.showsVerticalScrollIndicator = NO;
}
-(void)createView
{
    MineVeiw * minVew = [MineVeiw RegisterMineView];
    
    [minVew mineViewSetButtonTag];
    minVew.mineDelegate = self;
    minVew.frame = CGRectMake(0, 0, WIDETH
                              , 450);
    minVew.backgroundColor = color(243, 243, 243);
    [self.scro addSubview:minVew];
    self.scro.contentSize = CGSizeMake(WIDETH,450+44);
    
}
-(void)homeView:(MineVeiw *)mineView DidClickButton:(THMineViewButtonType)button
{
    switch (button) {
        case THMineViewButtonTypeHeadPortraitBtn:
        {NSLog(@"编辑头像");
            break;
        }
        case THMineViewButtonTypeEditInformationBtn:
        {NSLog(@"编辑资料");
            MineEditVC * edit = [[MineEditVC alloc] init];
            [self.navigationController pushViewController:edit animated:YES];
            break;
        }
        case THMineViewButtonTypeDeliveryJobsBtn:
        {NSLog(@"投递职位");
            TH_DeliveryJobVC * edit = [[TH_DeliveryJobVC alloc] init];
            [self.navigationController pushViewController:edit animated:YES];
            break;
        }
        case THMineViewButtonTypeCollectionJobs:
        {NSLog(@"收藏职位");
            TH_JobWishlistVC * edit = [[TH_JobWishlistVC alloc] init];
            [self.navigationController pushViewController:edit animated:YES];
            break;
        }
        case THMineViewButtonTypeResume:
        {NSLog(@"简历管理");
//            TH_EditInformationVC * edit = [[TH_EditInformationVC alloc] init];
//            [self.navigationController pushViewController:edit animated:YES];
            break;
        }
        case THMineViewButtonTypeAboutEggshellBtn:
        {NSLog(@"关于蛋壳儿");
            break;
        }
        case THMineViewButtonTypeChannelsCooperation :
        {NSLog(@"合作渠道");
//            TH_EditInformationVC * edit = [[TH_EditInformationVC alloc] init];
//            [self.navigationController pushViewController:edit animated:YES];
            break;
        }
        case THMineViewButtonTypesignOut:
        {
            NSLog(@"退出登录");
//            TH_EditInformationVC * edit = [[TH_EditInformationVC alloc] init];
//            [self.navigationController pushViewController:edit animated:YES];
            break;
        }
            
            
        default:
            break;
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
