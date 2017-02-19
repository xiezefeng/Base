//
//  BaserTabBarController.m
//  BBGO
//
//  Created by 谢泽锋 on 206//.
//  Copyright © 206年 xiezefeng. All rights reserved.
//
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#import "BaserTabBarController.h"

#import "TaskViewController.h"
#import "NearViewController.h"
#import "SkillsViewController.h"
#import "MeassageViewController.h"
#import "MyViewController.h"
#import "LoginViewController.h"

#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "MyReleaseController.h"

@interface BaserTabBarController ()<UITabBarControllerDelegate>
{
    MyViewController * MVC ;
}
@end

@implementation BaserTabBarController
-(void)MyRelease{
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"MyReleaseController" bundle:MainBunlde];
    MyReleaseController * MRVC = [story instantiateViewControllerWithIdentifier:@"MyReleaseController"];
    self.selectedIndex  = 4;
    BaseNavigationController * base = self.childViewControllers[4];
    [base pushViewController:MRVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MyRelease) name:@"MyRelease" object:nil];
    //                UIStoryboard * story = [UIStoryboard storyboardWithName:@"MyReleaseController" bundle:MainBunlde];
    //                MyReleaseController * MRVC = [story instantiateViewControllerWithIdentifier:@"MyReleaseController"];
    //                [self.navigationController pushViewController:MRVC animated:YES];
//    UIStoryboard * tkStro = [UIStoryboard storyboardWithName:@"TaskViewController" bundle:MainBunlde];
    TaskViewController *TKVC = [TaskViewController new];
    self.delegate = self;
    //    TaskViewController *TKVC = [[TaskViewController alloc]init];
    
    
    //    UIStoryboard * teamStroy = [UIStoryboard storyboardWithName:@"TeamPageController" bundle:MainBunlde];
    NearViewController * NEVC = [[NearViewController alloc]init];
    NEVC.type = 1;

    //    UIStoryboard * findStroy = [UIStoryboard storyboardWithName:@"FindPageController" bundle:MainBunlde];
//    SkillsViewController * SKVC = [[SkillsViewController alloc]init];
    NearViewController * SKVC = [[NearViewController alloc]init];

    SKVC.type = 2;

    
    //    UIStoryboard * myStroy = [UIStoryboard storyboardWithName:@"MyPageController" bundle:MainBunlde];
    MeassageViewController * MEVC = [[MeassageViewController alloc]init];
    MEVC.title = @"消息中心";  
    

    
    MVC = [[MyViewController alloc]init];
    
    [self addViewControlerWithClass:TKVC title:@"官方" image:@"nearby_star03" selectImage:@"nearby_star03_active"];
    [self addViewControlerWithClass:NEVC  title:@"附近" image:@"nearby_location" selectImage:@"nearby_location_active"];
    [self addViewControlerWithClass:SKVC title:@"技能" image:@"index_skill" selectImage:@"index_skill_active"];
    [self addViewControlerWithClass:MEVC  title:@"消息" image:@"person_message" selectImage:@"person_message_active"];
    [self addViewControlerWithClass:MVC title:@"我的" image:@"index_user" selectImage:@"index_user_active"];
//
    
    self.tabBar.tintColor = TabTitle_SelteColor;//选中时的颜色
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;

}
- (void)tabBarSeletedView:(NSNotification *)note
{
    //跳转tabBar通知
    self.selectedIndex = [note.object[@"index"] integerValue];
}
-(void)addViewControlerWithClass:(UIViewController *)vc
                         title:(NSString *)title
                         image:(NSString *)image
                   selectImage:(NSString *)selectImage
{

    vc.title = title;
    BaseNavigationController *nc = [[BaseNavigationController alloc] initWithRootViewController:vc];
    nc.tabBarItem.image = [UIImage imageNamed:image];
    //注意: iOS8需要加
    nc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
//    nc.navigationBar.barTintColor = Main_Color;
    [nc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    nc.navigationBar.tintColor = [UIColor whiteColor];
    [self addChildViewController:nc];
//    
//    //添加到tabBar中
//    NSMutableArray *marr = [[NSMutableArray alloc] initWithArray:self.viewControllers];
//    [marr addObject:nc];
//    self.viewControllers = marr;
}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    User * user = [User shareUser];
//    if (!user.TaoBaoID) {
//        BBLoginViewController *lvc = [BBLoginViewController new];
//        [self presentViewController:lvc animated:YES completion:nil];
//    }
//}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    for (UIViewController *vc in viewController.childViewControllers)
    {
        if ([vc class] == [MyViewController class] ||[vc class] == [MeassageViewController class])
        {
            UserYTJ * user = [UserYTJ shareUser];
            if (user.imSig.length<= 0)
            {
                UIStoryboard * stroy = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:MainBunlde];
                LoginViewController * LVC = [stroy instantiateViewControllerWithIdentifier:@"LoginViewController"];
                UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:LVC];
                //注意: iOS8需要加

            
                //    nc.navigationBar.barTintColor = Main_Color;
                [nc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
                nc.navigationBar.tintColor = [UIColor whiteColor];
                [self presentViewController:nc animated:YES completion:nil];
            }
        }
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [SZNotificationCenter addObserver:self selector:@selector(tabBarSeletedView:) name:kPSeleTedTabBarNotifitationName object:nil];
}
- (void)dealloc
{
    [SZNotificationCenter removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
