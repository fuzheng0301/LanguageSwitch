//
//  TwoViewController.h
//  中英文切换Demo
//
//  Created by fuzheng on 16/1/18.
//  Copyright © 2016年 fuzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

// ----- 多语言设置
#define CHINESE @"zh-Hans"
#define ENGLISH @"en"
#define AppLanguage @"appLanguage"
#define CustomLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]

@interface TwoViewController : UIViewController

@end
