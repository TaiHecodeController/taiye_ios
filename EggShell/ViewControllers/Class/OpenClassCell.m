//
//  OpenClassCell.m
//  EggShell
//
//  Created by 太和 on 15/8/11.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "OpenClassCell.h"

@interface OpenClassCell ()


@end

@implementation OpenClassCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _coverView = [[UIImageView alloc]init];
        [self addSubview:_coverView];
        
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = [UIFont systemFontOfSize:13];
        _titleLab.textColor = [UIColor whiteColor];
        [self addSubview:_titleLab];
        
        _nameLab = [[UILabel alloc]init];
        _nameLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_nameLab];
        
        _redXinBtn = [[UIButton alloc]init];
        _redXinBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_redXinBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:_redXinBtn];
        
        _priceBtn = [[UIButton alloc]init];
        _priceBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_priceBtn setTitleColor:UIColorFromRGB(0x37acf4) forState:UIControlStateNormal];
        [self addSubview:_priceBtn];
        
        _companyLab = [[UILabel alloc]init];
        _companyLab.font = [UIFont systemFontOfSize:11];
        _companyLab.textColor = UIColorFromRGB(0x646464);
        [self addSubview:_companyLab];

    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat y = 0;
    
    _coverView.frame = CGRectMake(0, y, self.frame.size.width, 85);
    
    y += _coverView.frame.size.height + 5;
    CGSize nameSize = [_nameLab.text sizeWithFont:_nameLab.font];
    _nameLab.frame = CGRectMake(0, y, nameSize.width, nameSize.height);
    
    _redXinBtn.frame = CGRectMake(CGRectGetMaxX(_nameLab.frame) + 25,y, 35, 12);
    
    _priceBtn.frame = CGRectMake(CGRectGetMaxX(_redXinBtn.frame) + 25, y, 30, 12);
    
    CGSize comSize = [_companyLab.text sizeWithFont:_companyLab.font];
    _companyLab.frame = CGRectMake(0, CGRectGetMaxY(_nameLab.frame) + 5, comSize.width, comSize.height);
    
}



@end
