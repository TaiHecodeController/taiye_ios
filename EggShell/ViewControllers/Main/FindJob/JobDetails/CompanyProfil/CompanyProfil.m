//
//  CompanyProfil.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/10.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "CompanyProfil.h"

@implementation CompanyProfil


- (IBAction)companyClick:(UIButton *)sender {
    
    [self.companyDelegate CompanyProfilView:self];
}

@end
