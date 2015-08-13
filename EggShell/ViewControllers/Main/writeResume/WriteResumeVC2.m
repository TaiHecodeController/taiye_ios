//
//  WriteResumeVC2.m
//  EggShell
//
//  Created by mac on 15/8/14.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "WriteResumeVC2.h"
#import "WriteResumeCell2.h"

@interface WriteResumeVC2 ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * writeTabView;
}
@property (strong,nonatomic)NSArray * nameArray;
@end

@implementation WriteResumeVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"写简历";
    self.view.backgroundColor = [UIColor colorWithRed:243 / 255.0 green:243 / 255.0 blue:241 / 255.0 alpha:1];
    
    [self createUI];
    [self createData];
    // Do any additional setup after loading the view.
}

-(void)createData
{
    self.nameArray = @[@"工作经历",@"教育经历",@"培训经历",@"专业技能",@"项目经验",@"证书",@"自我评价"];
}

-(void)createUI
{
    self.resumeNameLab = [ZCControl createLabelWithFrame:CGRectMake(15, 10, 120, 20) Font:14 Text:@"个人简历001"];
    [self.view addSubview:self.resumeNameLab];
    
    writeTabView = [[UITableView alloc] initWithFrame:CGRectMake(-15, 42, WIDETH + 15, 294)];
    writeTabView.delegate = self;
    writeTabView.dataSource = self;
    writeTabView.scrollEnabled = NO;
    writeTabView.layer.borderColor = [UIColor colorWithRed:221 / 255.0 green:221 / 255.0 blue:221 / 255.0 alpha:1].CGColor;
    writeTabView.layer.borderWidth = 0.5;
    writeTabView.separatorColor = [UIColor colorWithRed:221 / 255.0 green:221 / 255.0 blue:221 / 255.0 alpha:1];
    [self.view addSubview:writeTabView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 42;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WriteResumeCell2 * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WriteResumeCell2" owner:self options:nil] firstObject];
    }
    cell.nameLab.text = self.nameArray[indexPath.row];
    if(indexPath.row >1)
    {
        cell.stateBtn.selected = NO;
    }else
    {
        cell.stateBtn.selected = YES;
    }
    return cell;
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
