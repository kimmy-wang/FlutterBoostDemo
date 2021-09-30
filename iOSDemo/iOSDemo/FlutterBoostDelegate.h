//
//  FlutterBoostDelegate.h
//  iOSDemo
//
//  Created by Ying Wang on 2021/9/30.
//

#import <flutter_boost/FlutterBoost.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterBoostDelegate : NSObject<FlutterBoostDelegate>

@property (nonatomic,strong) UINavigationController *navigationController;

@end

NS_ASSUME_NONNULL_END
