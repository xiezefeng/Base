//
//  CommonButton.m
//  BBGO
//
//  Created by 谢泽锋 on 2016/11/18.
//  Copyright © 2016年 xiezefeng. All rights reserved.
//

#import "CommonButton.h"

@implementation CommonButton
-(void)awakeFromNib{
    [super awakeFromNib];
    self.layer.borderColor = self.titleLabel.textColor.CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
