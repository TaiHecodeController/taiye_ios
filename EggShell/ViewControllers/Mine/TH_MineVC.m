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
#import "TH_JobWishlistVC.h"
#import "TH_LoginVC.h"
#import "TH_AboutEggshellVC.h"
#import "AppDelegate.h"
#import "ManagerResumeVC.h"
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
    minVew.frame = CGRectMake(-WIDETH, 0, WIDETH
                              , 450);
    minVew.backgroundColor = color(243, 243, 243);
    [self.scro addSubview:minVew];
    [UIView animateWithDuration:1 delay:0.0 usingSpringWithDamping:0.5
          initialSpringVelocity:10 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        minVew.frame = CGRectMake(0, 0, WIDETH
                                  , 450);
    } completion:nil];
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
            MineEditVC * edits = [[MineEditVC alloc] init];
            [self.navigationController pushViewController:edits animated:YES];
            break;
        }
        case THMineViewButtonTypeDeliveryJobsBtn:
        {NSLog(@"投递职位");
            TH_JobWishlistVC * edit = [[TH_JobWishlistVC alloc] init];
            edit.title = @"投递职位";
            [self.navigationController pushViewController:edit animated:YES];            break;
        }
        case THMineViewButtonTypeCollectionJobs:
        {NSLog(@"收藏职位");
            TH_JobWishlistVC * edit = [[TH_JobWishlistVC alloc] init];
            edit.title = @"收藏职位";
            [self.navigationController pushViewController:edit animated:YES];
            break;
        }
        case THMineViewButtonTypeResume:
        {NSLog(@"简历管理");
            ManagerResumeVC * manager = [[ManagerResumeVC alloc] init];
            [self.navigationController pushViewController:manager animated:YES];
            break;
        }
        case THMineViewButtonTypeAboutEggshellBtn:
        {NSLog(@"关于蛋壳儿");
            TH_AboutEggshellVC * aboutAgger = [[TH_AboutEggshellVC alloc] init];
            aboutAgger.title = @"关于蛋壳儿";
            [self.navigationController pushViewController:aboutAgger animated:YES];
            break;
        }
        case THMineViewButtonTypeChannelsCooperation :
        {NSLog(@"合作渠道");
            TH_LoginVC * login = [[TH_LoginVC alloc] init];
            [self.navigationController pushViewController:login animated:YES];
            break;
        }
        case THMineViewButtonTypesignOut:
        {
             NSLog(@"退出登录");
            self.navigationController.navigationBarHidden = YES;
            AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
            appDelegate.mainTabBar = [[TH_MainTabBarController alloc] init];
            
            appDelegate.mainTabBar.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:appDelegate.mainTabBar animated:YES completion:nil];
            break;
        }
        case THMineViewButtonTypeLogin:
        {
        
            
            TH_LoginVC * login = [[TH_LoginVC alloc] init];
            [self.navigationController pushViewController:login animated:YES];
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
