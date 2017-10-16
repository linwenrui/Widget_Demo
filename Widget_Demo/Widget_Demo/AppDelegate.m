//
//  AppDelegate.m
//  Widget_Demo
//
//  Created by XH-LWR on 2017/10/16.
//  Copyright © 2017年 XH-LWR. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - iOS9之后

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

    if ([url.scheme isEqualToString:@"MyWidget"]) {
        
        NSLog(@"url = %@", url);
    }
    return YES;
}

#pragma mark - iOS9之前

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {

    if ([url.scheme isEqualToString:@"MyWidget"]) {
        
        
    }
    return YES;
}

@end
