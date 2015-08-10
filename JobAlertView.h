//
//  JobAlertView.h
//  EggShell
//
//  Created by mac on 15/8/10.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobAlertView : UIView
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
- (IBAction)selectBtnClcik:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
- (IBAction)cancelClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *upBackView;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
- (IBAction)okClick:(id)sender;

-(void)show;

@end
