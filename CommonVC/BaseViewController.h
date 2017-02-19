//
//  BaseViewController.h
//  BBGO
//
//  Created by 谢泽锋 on 2016/11/11.
//  Copyright © 2016年 xiezefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserYTJ.h"
#define  BaseBlueColor RGBA(120, 150, 255, 1)

@interface BaseViewController : UIViewController
@property(nonatomic,strong)UserYTJ * user;
-(void)showLoading;

/**
 添加右边按钮

 @param title  <#title description#>
 @param image  <#image description#>
 @param select <#select description#>

 @return <#return value description#>
 */
-(UIButton*)addRightButton:(NSString*)title image:(UIImage*)image Action:(SEL)select;
-(BOOL)isLogin;

@end
