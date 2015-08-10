//
//  JobAlertView.m
//  EggShell
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "JobAlertView.h"
#import "AppDelegate.h"
@interface JobAlertView()
{
    UIView * _backView;
    UIImageView * _selectedTick;
}
@end

@implementation JobAlertView

alloc_with_xib(JobAlertView)

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _selectedTick = [[UIImageView alloc] initWithFrame:self.selectBtn.bounds];
        _selectedTick.image = [UIImage imageNamed:@"duihaolan"];
        [self.selectBtn addSubview:_selectedTick];
    }
    return self;
}

- (IBAction)selectBtnClcik:(UIButton *)sender {
    if(sender.isSelected)
    {
        _selectedTick.hidden = NO;
    }else
    {
        _selectedTick.hidden = YES;
    }
    sender.selected = !sender.selected;
    
}
- (IBAction)cancelClick:(UIButton *)sender {
    [self removeFromSuperview];
    [_backView removeFromSuperview];
}
- (IBAction)okClick:(id)sender {
    [self removeFromSuperview];
    [_backView removeFromSuperview];
}

-(void)show
{
    AppDelegate * dele = [UIApplication sharedApplication].delegate;

    _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.5;
    
    [dele.window addSubview:_backView];
    [dele.window addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.center = dele.window.center;
    }];
}

@end
