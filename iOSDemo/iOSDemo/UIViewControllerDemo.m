//
//  UIViewControllerDemo.m
//  iOSDemo
//
//  Created by Ying Wang on 2021/9/30.
//

#import "UIViewControllerDemo.h"
#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoost.h>


@interface UIViewControllerDemo ()

@end

@implementation UIViewControllerDemo


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)pushFlutterPage:(id)sender {
    
    FlutterBoostRouteOptions* options = [[FlutterBoostRouteOptions alloc]init];
    options.pageName = @"flutterPage";
    options.arguments = @{@"animated":@(YES)};
    options.completion = ^(BOOL completion) {
        
    };
    
    [[FlutterBoost instance]open:options];
}

- (IBAction)present:(id)sender {
    FlutterBoostRouteOptions* options = [[FlutterBoostRouteOptions alloc]init];
    options.pageName = @"transparentWidget";
    options.arguments = @{@"present":@(YES)};
    options.opaque = NO;
    options.completion = ^(BOOL completion) {

    };

    [[FlutterBoost instance]open:options];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
@end
