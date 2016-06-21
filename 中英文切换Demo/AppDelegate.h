//
//  AppDelegate.h
//  中英文切换Demo
//
//  Created by fuzheng on 16/1/18.
//  Copyright © 2016年 fuzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

// ----- 多语言设置
#define kNotificationLanguageChanged @"kNotificationLanguageChanged"
#define CHINESE @"zh-Hans"
#define ENGLISH @"en"
#define AppLanguage @"appLanguage"
#define LanguageFileName @"Localizable"
//#define LocationLanguage(key) NSLocalizedStringFromTable(str, LanguageFileName, nil)
#define LocationLanguage(key) [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

