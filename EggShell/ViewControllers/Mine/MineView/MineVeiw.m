//
//  MineVeiw.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/11.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "MineVeiw.h"
@interface MineVeiw()
@property (weak, nonatomic) IBOutlet UIButton *HeadPortraitBtn;
@property (weak, nonatomic) IBOutlet UIButton *EditInformationBtn;
@property (weak, nonatomic) IBOutlet UIButton *DeliveryJobsBtn;
@property (weak, nonatomic) IBOutlet UIButton *CollectionJobs;
@property (weak, nonatomic) IBOutlet UIButton *Resume;
@property (weak, nonatomic) IBOutlet UIButton *AboutEggshellBtn;
@property (weak, nonatomic) IBOutlet UIButton *ChannelsCooperation;

@property (weak, nonatomic) IBOutlet UIButton *signOut;


@end
@implementation MineVeiw
-(void)mineViewSetButtonTag;

{

    self.HeadPortraitBtn.tag  = THMineViewButtonTypeHeadPortraitBtn;
    self.EditInformationBtn.tag = THMineViewButtonTypeEditInformationBtn;
    self.DeliveryJobsBtn.tag = THMineViewButtonTypeDeliveryJobsBtn;
    self.CollectionJobs.tag = THMineViewButtonTypeCollectionJobs;
    self.Resume.tag = THMineViewButtonTypeResume;
    self.AboutEggshellBtn.tag = THMineViewButtonTypeAboutEggshellBtn;
    self.ChannelsCooperation.tag = THMineViewButtonTypeChannelsCooperation;
    self.signOut.tag =  THMineViewButtonTypesignOut;
   
}
+(MineVeiw*)RegisterMineView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MineView" owner:self options:nil] lastObject];
}

- (IBAction)mineViewBtnClick:(UIButton*)sender {
    if ([self.mineDelegate respondsToSelector:@selector(homeView:DidClickButton:)]) {
    [self.mineDelegate homeView:self DidClickButton:(THMineViewButtonType)sender.tag];
    NSLog(@"kjsdjfbvs");
    }
}


@end