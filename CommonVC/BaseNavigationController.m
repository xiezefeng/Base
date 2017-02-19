//
//  BaseNavigationController.m
//  BBGO
//
//  Created by 谢泽锋 on 2016/11/11.
//  Copyright © 2016年 xiezefeng. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property(nonatomic,weak) UIViewController * currentShowVC;

@end

@implementation BaseNavigationController
-(id)initWithRootViewController:(UIViewController *)rootViewController {
    BaseNavigationController *nvc= [super initWithRootViewController:rootViewController];
    self.interactivePopGestureRecognizer.delegate = self;
    nvc.delegate = self;
    return nvc;
}
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController* )viewController animated:(BOOL)animated {
    if (navigationController.viewControllers.count == 1)
        self.currentShowVC = Nil;
    else
        self.currentShowVC = viewController;
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        return (self.currentShowVC == self.topViewController);
    }
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = Main_Color;
    
    
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (self.viewControllers.count > 1) {
        self.tabBarController.tabBar.hidden=YES;
    }else{
        self.tabBarController.tabBar.hidden=NO;
    }
    
    return [super popViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 第一个 控制器 不需要隐藏tabbar
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.tabBarController.tabBar.hidden=YES;
    }else{
        self.tabBarController.tabBar.hidden=NO;
    }
    [super pushViewController:viewController animated:animated];
    
}
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 第一个 控制器 不需要隐藏tabbar
    if (self.viewControllers.count > 2) {
        [self.tabBarController.tabBar setHidden:YES];
    } else {
        [self.tabBarController.tabBar setHidden:NO];
    }
    return [super popToViewController:viewController animated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];
    
    return [super popToRootViewControllerAnimated:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.viewControllers.count > 1) {
        [self.tabBarController.tabBar setHidden:YES];
    } else {
        [self.tabBarController.tabBar setHidden:NO];
    }
}
@end
