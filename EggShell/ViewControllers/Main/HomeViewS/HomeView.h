//
//  HomeView.h
//  EggShell
//
//  Created by 李李贤军 on 15/8/7.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{   THHomeViewButtonTypeFindJob,
    THHomeViewButtonTypeFindPartTime,
    THHomeViewButtonTypeInternshipSearch,
    THHomeViewButtonTypeInformationDesk,
    THHomeViewButtonTypeResumeWriting,
    THHomeViewButtonTypePlayFan,
    THHomeViewButtonTypeMicroSocial,
    THHomeViewButtonTypeOpenClass,
}THHomeViewButtonType;
@class HomeView;
@protocol THHomeVieWDelegate <NSObject>
@optional
-(void)homeViewFindJob:(HomeView*)homeView DidClickButton:(THHomeViewButtonType)button;
@end
@interface HomeView : UIView
+(instancetype)homeViewFinJob;
-(void)setHomeViewBtn;
@property(nonatomic,strong)id<THHomeVieWDelegate>homeViewDelegate;

@end
