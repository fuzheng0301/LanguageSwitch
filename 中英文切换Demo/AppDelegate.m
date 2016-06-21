//
//  AppDelegate.m
//  中英文切换Demo
//
//  Created by fuzheng on 16/1/18.
//  Copyright © 2016年 fuzheng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //确定当前语言状态
    [self getCurrentLanguage];
    
    //判断是否是第一次启动
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        //设置本地语言
        if ([self isChineseLanguage]) {
            NSString *languageStr = @"zh-Hans";
            [[NSUserDefaults standardUserDefaults] setObject:languageStr forKey:AppLanguage];
        }else{
            NSString *languageStr = @"en";
            [[NSUserDefaults standardUserDefaults] setObject:languageStr forKey:AppLanguage];
        }
    }
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nc;
    
    return YES;
}

#pragma mark --- 获取系统语言
- (NSString *)getCurrentLanguage
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return currentLanguage;
}

#pragma mark --- 判断当前系统语言为中文
- (BOOL)isChineseLanguage
{
    BOOL isChinese = NO;
    if ([[self getCurrentLanguage] rangeOfString:@"zh-Hans"].length > 0) {
        isChinese = YES;
        NSLog(@"当前中文");
    }
    return isChinese;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
