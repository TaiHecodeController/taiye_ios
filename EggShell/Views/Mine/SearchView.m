//
//  SearchView.m
//  EggShell
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.placeholderLab.text = @"";
}



- (IBAction)citylistClick:(UIButton *)sender {
    
    
}

- (IBAction)scarchIconClick:(id)sender {
    self.searchClick();
    
    
}
@end
