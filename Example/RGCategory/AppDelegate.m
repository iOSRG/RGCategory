//
//  AppDelegate.m
//  RGCategory_Example
//
//  Created by 浮生似梦、Dream on 2019/8/21.
//  Copyright © 2019年 18607304107@163.com. All rights reserved.
//

#import "AppDelegate.h"
//#import "CALayer+BaseExtension.h"
#import <RGCategory/CALayer+BaseExtension.h>
#import <RGCategory/NSArray+Log.h>
#import <RGCategory/NSAttributedString+BaseExtension.h>
#import <RGCategory/NSDate+BaseExtension.h>
#import <RGCategory/NSObject+BaseExtension.h>
#import <RGCategory/NSString+AttributedString.h>
#import <RGCategory/NSDate+BaseExtension.h>
#import <RGCategory/RGView.h>
#import <RGCategory/UIColor+BaseExtension.h>
#import <RGCategory/UIFont+Swizzing.h>
#import <RGCategory/UIImage+BaseExtension.h>
#import <RGCategory/UIView+Frame.h>
#import <RGCategory/UIView+Borders.h>
#import <RGCategory/NSObject+MethodObserver.h>

//#import "AppDelegate+JPUSH.h"

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self testJpushWithOptions:launchOptions];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//MARK: - TEST
- (void)testJpushWithOptions:(NSDictionary *)launchOptions {
    
//    NSDictionary *jpushInfo = @{@"JPushAppkey" : @"4884736001375d686fc39a3b",@"JPushChannel" : @"1", @"isProduction" : @(YES)};
//    [self configureJPUSHSDKWithOptions:launchOptions jpushInfo:jpushInfo];
//    
//    __weak typeof(self) weakSelf = self;
//    [self receiveNotificationSucessIOS12Foreground:^(NSDictionary * _Nonnull userInfo) {
//        
//        NSLog(@"iOS12前台 userInfo = %@",userInfo);
//        
//    } IOS12Background:^(NSDictionary * _Nonnull userInfo) {
//        
//        NSLog(@"iOS12后台 userInfo = %@",userInfo);
//        
//    } IOS10Foreground:^(NSDictionary * _Nonnull userInfo) {
//        
//        NSLog(@"iOS10前台 userInfo = %@",userInfo);
//        
//    } IOS10Background:^(NSDictionary * _Nonnull userInfo) {
//        
//        NSLog(@"iOS10j后台 userInfo  =%@",userInfo);
//    } IOS7Foreground:^(NSDictionary * _Nonnull userInfo) {
//        
//        NSLog(@"iOS7前台 userInfo = %@",userInfo);
//    } IOS7Background:^(NSDictionary * _Nonnull userInfo) {
//        
//        NSLog(@"iOS7后台 userInfo = %@",userInfo);
//        
//    }];
    
}

@end
