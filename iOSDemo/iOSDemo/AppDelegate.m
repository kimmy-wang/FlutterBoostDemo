//
//  AppDelegate.m
//  iOSDemo
//
//  Created by Ying Wang on 2021/9/30.
//

#import "AppDelegate.h"
#import "FlutterBoostDelegate.h"
#import "UIViewControllerDemo.h"
#import "NativeViewController.h"
#import <flutter_boost/FlutterBoost.h>

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    //默认方法
    FlutterBoostDelegate* delegate=[[FlutterBoostDelegate alloc ] init];
    [[FlutterBoost instance] setup:application delegate:delegate callback:^(FlutterEngine *engine) {

    } ];
    
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid" image:nil tag:0];
   
    FBFlutterViewContainer *fvc = FBFlutterViewContainer.new ;

    [fvc setName:@"tab_friend" uniqueId:nil params:@{} opaque:YES];
    fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"flutter_tab" image:nil tag:1];


    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[vc,fvc];

    
    UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];
    
    delegate.navigationController=rvc;


    self.window.rootViewController = rvc;
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIButton *nativeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nativeButton.frame = CGRectMake(self.window.frame.size.width * 0.5 - 50, 200, 100, 40);
    nativeButton.backgroundColor = [UIColor redColor];
    [nativeButton setTitle:@"push native" forState:UIControlStateNormal];
    [nativeButton addTarget:self action:@selector(pushNative) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:nativeButton];
    
    UIButton *pushEmbeded = [UIButton buttonWithType:UIButtonTypeCustom];
    pushEmbeded.frame = CGRectMake(self.window.frame.size.width * 0.5 - 70, 150, 140, 40);
    pushEmbeded.backgroundColor = [UIColor redColor];
    [pushEmbeded setTitle:@"push embedded" forState:UIControlStateNormal];
    [pushEmbeded addTarget:self action:@selector(pushEmbeded) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:pushEmbeded];
    return YES;
}

#pragma mark - flutter lifecycle

- (void)pushNative
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
    [nvc pushViewController:vc animated:YES];
}
//
- (void)pushEmbeded
{
    UINavigationController *nvc = (id)self.window.rootViewController;
    UIViewController *vc = [[NativeViewController alloc] init];
    [nvc pushViewController:vc animated:YES];
}

@end
