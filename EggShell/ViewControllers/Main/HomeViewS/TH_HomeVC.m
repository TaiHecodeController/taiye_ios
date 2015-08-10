//
//  TH_HomeVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/8.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_HomeVC.h"
#import "HomeView.h"
#import "TH_FindJobVC.h"

#import "SearchView.h"
#import "AppDelegate.h"

#import "TH_FindPartTimeVC.h"
#import "TH_FindPracticeVC.h"

@interface TH_HomeVC ()<UIScrollViewDelegate,SGFocusImageFrameDelegate,THHomeVieWDelegate>
{
    UIView * _navBackView;
    SearchView * _searchView;
    
}

@property (nonatomic, strong)SGFocusImageFrame *bannerView;
@property (nonatomic, strong) NSMutableArray *arr;
@property(nonatomic,strong)UIScrollView * scro;
@property(nonatomic,strong)UIView * searChBgView;



@end

@implementation TH_HomeVC

- (NSMutableArray *)arr
{
    if (_arr == nil)
    {
        self.arr = [NSMutableArray array];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //状态栏
    [self setStatus];
    //ScroView
    [self createScro];
    //初始化轮播图
    [self configBannerView];
    [self quereData];
    //注册XIB
    [self createHomeView];
        //    UITextField * searchField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
    //    searchField.background = [UIImage imageNamed:@"bg_new.png"];
    //    [self.view addSubview:searchField];
    //    [self createNav];
    //    UINavigationBar * bar = self.navigationController.navigationBar;
    //    [self getBackView:bar];
    //
    //    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    //    scrollView.contentSize = CGSizeMake(320, 800);
    //    scrollView.delegate = self;
    //    [self.view addSubview:scrollView];
  
}
#pragma mark - - 搜素
-(void)createSearch
{
    
    _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 80, 330, 30)];
    [self.tabBarController.view addSubview:_searchView];
    
    _searChBgView = [[UIView alloc] initWithFrame:_searchView.bounds];
    _searChBgView.backgroundColor = [UIColor colorWithRed:40 / 255.0 green:42 / 255.0 blue:48 / 255.0 alpha:1];
    _searChBgView.alpha = 0;
    
    [self.navigationController.view addSubview:_searChBgView];
    //在navigation页面创建点击手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.tabBarController.view addGestureRecognizer:tap];
    
}
//取消textField编辑状态，收回键盘
-(void)tap
{
    [_searchView.searchTextField endEditing:YES];
}

#pragma mark - - scorView
-(void)createScro
{
    UIScrollView * scro = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT)];
    self.scro           = scro;
    
    self.scro.showsVerticalScrollIndicator  = NO;
    self.scro.delegate  = self;
    [self.view addSubview:scro];
}
#pragma mark - - 创建HomeView
-(void)createHomeView
{
    //注册HomeViews
    HomeView * homeView       = [HomeView homeViewFinJob] ;
    homeView.frame            = CGRectMake(0, 160, WIDETH, HEIGHT);
    homeView.homeViewDelegate  = self;
       [homeView setHomeViewBtn];
    [self.scro addSubview:homeView];
    self.scro.contentSize = CGSizeMake(WIDETH, 160+608+49);                
}
-(void)homeViewFindJob:(HomeView *)homeView DidClickButton:(THHomeViewButtonType )button
{
    self.navigationController.navigationBarHidden = NO;
    TH_FindJobVC * home =[[TH_FindJobVC alloc] init];
    switch (button) {
        case THHomeViewButtonTypeFindJob:
        {
            NSLog(@"找工作");
            
            [self.navigationController pushViewController:home animated:YES];
            break;
        }
        case THHomeViewButtonTypeFindPartTime:
        {
            TH_FindPartTimeVC * partTime = [[TH_FindPartTimeVC alloc] init];
            NSLog(@"找兼职");
            [self.navigationController pushViewController:partTime animated:YES];
            break;
        }
        case THHomeViewButtonTypeInternshipSearch:
        {NSLog(@"找实习");
            TH_FindPracticeVC * partTime = [[TH_FindPracticeVC alloc] init];
            [self.navigationController pushViewController:partTime animated:YES];
            break;
        }
        case THHomeViewButtonTypeInformationDesk:
        {NSLog(@"信息台");
            [self.navigationController pushViewController:home animated:YES];
            break;
        }
        case THHomeViewButtonTypeResumeWriting:
        {NSLog(@"写简历");
            [self.navigationController pushViewController:home animated:YES];
            break;
        }
        case THHomeViewButtonTypePlayFan:
        {NSLog(@"玩出范");
            [self.navigationController pushViewController:home animated:YES];
            break;
        }
        case THHomeViewButtonTypeMicroSocial:
        {NSLog(@"微社交");
            [self.navigationController pushViewController:home animated:YES];
            break;
        }
          case THHomeViewButtonTypeOpenClass:
        {NSLog(@"公开课");
            [self.navigationController pushViewController:home animated:YES];
            break;
        }
        default:
            break;
    }

}

#pragma mark - - 轮播图
- (void)configBannerView
{
    //建立banner图
    _bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 180)];
    _bannerView.isAutoPlay = YES;
    _bannerView.delegate = self;
    _bannerView.changeFocusImageInterval = 2;
    [self.scro addSubview:_bannerView];
    
}

- (void)quereData
{
    //    NSString *str1 = @"http://s13.mogujie.cn/b7/bao/131012/vud8_kqywordekfbgo2dwgfjeg5sckzsew_310x426.jpg_200x999.jpg";
    //    NSString *str2 = @"http://s6.mogujie.cn/b7/bao/130928/c7k0_kqyw6vckkfbgeq3wgfjeg5sckzsew_500x750.jpg_200x999.jpg";
    //    NSString *str3 = @"http://s6.mogujie.cn/b7/bao/131008/q2o17_kqyvcz3ckfbewv3wgfjeg5sckzsew_330x445.jpg_200x999.jpg";
    //包含字典的数组，每个字典key为photo,value为string
    NSArray *imageArr = [NSArray arrayWithObjects:@{@"photo":@"lunbotu"},@{@"photo":@"lunbotu"},@{@"photo":@"lunbotu"}, nil];
    
    //加载数据
    [_bannerView setImageURLs:imageArr];
    
}

/*
 bannerView item 点击方法
 */
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(HomePageModel *)item
{
    NSLog(@"在此处进行跳转%@",item.extend);
}

#pragma mark - - 状态栏
-(void)setStatus
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.y / 250 >= 0.7)
    {
        return;
    }
    _searChBgView.alpha = scrollView.contentOffset.y / 250;
    
    
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

//删除搜索视图
-(void)viewWillDisappear:(BOOL)animated
{
    [_searChBgView removeFromSuperview];
    [_searchView removeFromSuperview];

    _searchView = nil;
    _searChBgView = nil;
}

//隐藏导航栏,创建搜索视图
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    //搜索
    [self createSearch];
    
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
