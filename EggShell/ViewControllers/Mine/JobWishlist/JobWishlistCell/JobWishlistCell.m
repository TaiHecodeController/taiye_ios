//
//  JobWishlistCell.m
//  EggShell
//
//  Created by 李李贤军 on 15/8/12.
//  Copyright (c) 2015年 wsd. All rights reserved.
//

#import "JobWishlistCell.h"

@implementation JobWishlistCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(JobWishlistCell*)RegisterJobWishListCell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"JobWishlistCell" owner:self options:nil] lastObject];

}
@end
