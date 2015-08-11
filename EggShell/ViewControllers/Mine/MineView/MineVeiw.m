//
//  MineVeiw.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/11.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "MineVeiw.h"

@implementation MineVeiw
+(MineVeiw*)RegisterMineView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MineView" owner:self options:nil] lastObject];
}

@end
