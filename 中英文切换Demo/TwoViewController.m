//
//  TwoViewController.m
//  中英文切换Demo
//
//  Created by fuzheng on 16/1/18.
//  Copyright © 2016年 fuzheng. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationItem.title = CustomLocalizedString(@"title", nil);
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.layer.borderWidth = 1.0;
    label.text = CustomLocalizedString(@"ok", nil);
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    [self buttonWithTitle:CustomLocalizedString(@"chinese", nil) frame:CGRectMake(50, 300, 200, 40) action:@selector(didClickChinese) AddView:self.view];
    
    [self buttonWithTitle:CustomLocalizedString(@"english", nil) frame:CGRectMake(50, 500, 200, 40) action:@selector(didClickEnglish) AddView:self.view];
    
}

-(void)didClickChinese
{
    if (![[[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage]isEqualToString:@"zh-Hans"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:AppLanguage];
        NSString *str = CustomLocalizedString(@"ok",nil);
        NSLog(@"%@",str);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)didClickEnglish
{
    if (![[[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage]isEqualToString:@"en"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:AppLanguage];
        NSString *str = CustomLocalizedString(@"ok",nil);
        NSLog(@"%@",str);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --- 创建button公共方法
/**使用示例:[self buttonWithTitle:@"点 击" frame:CGRectMake((self.view.frame.size.width - 150)/2, (self.view.frame.size.height - 40)/3, 150, 40) action:@selector(didClickButton) AddView:self.view];*/
-(UIButton *)buttonWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action AddView:(id)view
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchDown];
    [view addSubview:button];
    return button;
}

@end
