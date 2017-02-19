//
//  SureButton.m
//  BBGO
//
//  Created by 谢泽锋 on 2016/11/17.
//  Copyright © 2016年 xiezefeng. All rights reserved.
//

#import "SureButton.h"

@implementation SureButton
-(void)awakeFromNib{
    [super awakeFromNib];
//    self.backgroundColor = RGBA(32, 89, 181, 1);
    [self setTitleColor:[UIColor whiteColor] forState:0];
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 0.1;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
