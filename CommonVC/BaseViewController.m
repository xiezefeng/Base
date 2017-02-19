//
//  BaseViewController.m
//  BBGO
//
//  Created by 谢泽锋 on 2016/11/11.
//  Copyright © 2016年 xiezefeng. All rights reserved.
//

#import "BaseViewController.h"
//#import "WXApi.h"
@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

-(void)showLoading{
//    [HHPointHUD showWaitViewWithTitle:@"加載中..."];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    
   [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
  
    
    if (self.navigationController.viewControllers.count!=1) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 返回按钮内容左靠
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backBtn.frame = CGRectMake(0, 0, 15, 30);
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(5, -4, 0, 7);
        [self.navigationItem setHidesBackButton:YES];
        [backBtn setImage:[UIImage imageNamed:@"矩形9"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        backItem.title = @"";
        self.navigationItem.leftBarButtonItem = backItem;
    }
   
//    self.navigationItem.hidesBackButton = YES;
//    self.navigationItem.backBarButtonItem.title = @"";
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
//    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"nav_back"];
//    
//    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"nav_back"];
    
    
    
    
}
-(UIButton*)addRightButton:(NSString*)title image:(UIImage*)image Action:(SEL)select
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 返回按钮内容左靠
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    backBtn.frame = CGRectMake(0, 0, 40, 30);
    [backBtn setTitle:title forState:0];
//    [backBtn setImage:image forState:UIControlStateNormal];
    [backBtn addTarget:self action:select forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.rightBarButtonItem = backItem;
    return backBtn;

}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    for (int i=0; i<self.navigationController.navigationBar.subviews.count; i++) {
//        UIView * view = self.navigationController.navigationBar.subviews[i];
//        if (view.class ==NSClassFromString(@"UINavigationItemButtonView")) {
//            view.hidden = YES;
//        }
//    }
//
//}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController pushViewController:[[BaseViewController alloc]init] animated:YES];
//}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)isLogin
{
//    if (![self.user.userId integerValue]) {
//        UIStoryboard * stroy = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:MainBunlde];
//        LoginViewController * LVC = [stroy instantiateViewControllerWithIdentifier:@"LoginViewController"];
//        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:LVC];
//        //注意: iOS8需要加
//        //    nc.navigationBar.barTintColor = Main_Color;
//        [nc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//        nc.navigationBar.tintColor = [UIColor whiteColor];
//        [self presentViewController:nc animated:YES completion:nil];
//        return NO;
//    }
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
