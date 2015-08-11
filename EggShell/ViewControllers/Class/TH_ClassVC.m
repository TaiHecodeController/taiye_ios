//
//  TH_ClassVC.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/8.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "TH_ClassVC.h"
#import "HYSegmentedControl.h"
#import "jobTableViewCell.h"
#import "UIBarButtonItem+DC.h"
#import "jobModel.h"
#import "TH_JobDetailVC.h"
#import "OpenClassCell.h"
#import "MoviePlayerViewController.h"

#define bottomH 107


@interface TH_ClassVC ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HYSegmentedControl *segmentedControl;
@property (nonatomic, assign) int currentIndex;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *subclassArr;

@end

@implementation TH_ClassVC
//-(void)viewWillAppear:(BOOL)animated
//{
//    self.navigationController.navigationBar.translucent = YES;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公开课";
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = color(243, 243, 241);
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithNormalImageName:@"liebiao" hightImageName:nil action:@selector(rightClick) target:self];
//    
//    [self addRightBtn2_NormalImageName:@"sousuo001" hightImageName:nil action:@selector(rightClick2) target:self];
    
    [self initView];
    
    [self configCourseConllectionView];
    
    [self querData];
    
    [self hySegmentedControlSelectAtIndex:0];
    
}

- (void)initView
{
    
    CGFloat y = 0;
    CGFloat margin = 10;
    
    NSArray *iconArr = @[@[@"shipin2",@"shipin"],@[@"yuyin2",@"yuyin"]];
    
    _segmentedControl = [[HYSegmentedControl alloc] initWithOriginY:y Titles:@[@"视频课程", @"语音课程"]  IconNames:iconArr delegate:self] ;
    [self.view addSubview:_segmentedControl];
    
    
    

    
}

- (void)querData
{
    
}

#pragma mark -- configConllectionView
- (void)configCourseConllectionView
{
    CGFloat margin = 20;
    CGFloat minimargin = 10;
    CGFloat y = 40;
    
    UIView *headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, y, WIDETH, 154);
    headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headView];
    
    CGSize msfcSize = [@"名师风采" sizeWithFont:[UIFont systemFontOfSize:15]];
    UILabel *msfcLab = [[UILabel alloc]initWithFrame:CGRectMake(margin, minimargin, msfcSize.width, msfcSize.height)];
    msfcLab.text = @"名师风采";
    msfcLab.font = [UIFont systemFontOfSize:15];
    [headView addSubview:msfcLab];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UIColorFromRGB(0xdddddd);
    lineView.frame = CGRectMake(0, CGRectGetMaxY(msfcLab.frame) + minimargin, WIDETH, 0.5);
    [headView addSubview:lineView];
    
    int count = 3;
    CGFloat qsBtnMargin = ((WIDETH - 3 * 90) / (count + 1));
    for (int i = 0; i < count; i++)
    {
        UIButton *qsBtn = [[UIButton alloc]init];
        
        CGFloat qsBtnW = 90;
        CGFloat qsBtnH = 90;
        CGFloat qsBtnX = qsBtnMargin + i * (qsBtnW + qsBtnMargin);
        CGFloat qsBtnY = CGRectGetMaxY(lineView.frame) + 15;
        qsBtn.frame = CGRectMake(qsBtnX, qsBtnY, qsBtnW, qsBtnH);
        qsBtn.tag = 1000 + i;
        [qsBtn addTarget:self action:@selector(qsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        qsBtn.backgroundColor = [UIColor blackColor];
        [qsBtn setBackgroundImage:[UIImage imageNamed:@"laoshi1"] forState:UIControlStateNormal];
        [headView addSubview:qsBtn];
    }
    
    UIView *marginView = [[UIView alloc]init];
    marginView.backgroundColor = color(243, 243, 241);
    marginView.frame = CGRectMake(0, CGRectGetMaxY(headView.frame), WIDETH, 10);
    [self.view addSubview:marginView];
    
    UIView *collectionHeadView = [[UIView alloc]init];
    collectionHeadView.frame = CGRectMake(0, CGRectGetMaxY(marginView.frame), WIDETH, 40);
//    collectionHeadView.backgroundColor = [UIColor redColor];
    [self.view addSubview:collectionHeadView];
    
    UILabel *rmkcLab = [[UILabel alloc]init];
    rmkcLab.text = @"热门课程";
    rmkcLab.font = [UIFont systemFontOfSize:15];
    CGSize rmkcSize = [rmkcLab.text sizeWithFont:rmkcLab.font];
    rmkcLab.frame = CGRectMake(margin, minimargin, rmkcSize.width, rmkcSize.height);
    [collectionHeadView addSubview:rmkcLab];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = UIColorFromRGB(0xdddddd);
    lineView1.frame = CGRectMake(0, CGRectGetHeight(collectionHeadView.frame) - 0.5, WIDETH, 0.5);
    [collectionHeadView addSubview:lineView1];

    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(155, 120);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(margin, CGRectGetMaxY(collectionHeadView.frame), WIDETH - 2 * margin, HEIGHT - CGRectGetMaxY(collectionHeadView.frame) - 44 - 66) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    //注册cell 头视图
    [_collectionView registerClass:[OpenClassCell class] forCellWithReuseIdentifier:@"RK_collectionViewCell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RK_headView"];
}

#pragma mark -UICollectionViewDataSource
//指定组的个数 ，一个大组！！不是一排，是N多排组成的一个大组(与下面区分)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//指定单元格的个数 ，这个是一个组里面有多少单元格，e.g : 一个单元格就是一张图片
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    return _subclassArr.count;
    return 10;
}

//构建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    OpenClassCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RK_collectionViewCell" forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor redColor];
    cell.coverView.image = [UIImage imageNamed:@"remen"];
    cell.nameLab.text = @"王伟光";
    [cell.redXinBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
    [cell.redXinBtn setTitle:@"300" forState:UIControlStateNormal];
    [cell.priceBtn setImage:[UIImage imageNamed:@"qian"] forState:UIControlStateNormal];
    [cell.priceBtn setTitle:@"9元" forState:UIControlStateNormal];
    cell.companyLab.text = @"中国惠普";
    
    return cell;
}

//组的头视图创建
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"RK_headView" forIndexPath:indexPath];
    headView.backgroundColor = [UIColor blueColor];
    return headView;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - 3 * 80) / 4;
    return UIEdgeInsetsMake(5, 0, 10, 0);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //播放视频
    NSURL *Url = [NSURL URLWithString:@"00018093b103eb7fe795cf4cebab8871_0"];
    if (!Url) {
        return;
    }
    MoviePlayerViewController *moviePlayer =    [[MoviePlayerViewController alloc] initNetworkMoviePlayerViewControllerWithURL:Url movieTitle:@"标题"];
    
    [self.navigationController presentViewController:moviePlayer animated:YES completion:nil];
}


- (void)hySegmentedControlSelectAtIndex:(NSInteger)index
{
    if (index == 0)
    {
        
        _currentIndex = 0;
        //        [dataArray removeAllObjects];
        //        [dataArray addObject:@"1"];
        //        [dataArray addObject:@"2"];
        //        [dataArray addObject:@"3"];
        //        [dataArray addObject:@"4"];
        //        [dataArray addObject:@"5"];
        
//        [_tableView reloadData];
//                _tableView.hidden = YES;
        //        _gridView.hidden = NO;
    }
    else
    {
        _currentIndex = 1;
        //        [dataArray removeAllObjects];
        //        [dataArray addObject:@"11"];
        //        [dataArray addObject:@"22"];
        //        [dataArray addObject:@"33"];
        //        [dataArray addObject:@"44"];
        //        [dataArray addObject:@"55"];
        
//        [_tableView reloadData];
        //        _gridView.hidden = YES;
        //        _tableView.hidden = NO;
    }
}

#pragma mark -- respondEvent
- (void)qsBtnClick:(UIButton *)sender
{
    if (sender.tag == 1000)
    {
        THLog(@"名师风采被点击%ld",(long)sender.tag);
    }
    else if (sender.tag == 1001)
    {
        THLog(@"名师风采被点击%ld",(long)sender.tag);
    }
    else if (sender.tag == 1002)
    {
        THLog(@"名师风采被点击%ld",(long)sender.tag);
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
