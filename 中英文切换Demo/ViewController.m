//
//  ViewController.m
//  中英文切换Demo
//
//  Created by fuzheng on 16/1/18.
//  Copyright © 2016年 fuzheng. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()
{
    UILabel *label;
    
    UIButton *chineseBtn;
    UIButton *englishBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.layer.borderWidth = 1.0;
    label.text = CustomLocalizedString(@"ok", nil);
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    chineseBtn = [self buttonWithTitle:CustomLocalizedString(@"chinese", nil) frame:CGRectMake(50, 300, 200, 40) action:@selector(didClickChinese) AddView:self.view];
    
    englishBtn = [self buttonWithTitle:CustomLocalizedString(@"english", nil) frame:CGRectMake(50, 500, 200, 40) action:@selector(didClickEnglish) AddView:self.view];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [chineseBtn setTitle:CustomLocalizedString(@"chinese", nil) forState:UIControlStateNormal];
    
    [englishBtn setTitle:CustomLocalizedString(@"english", nil) forState:UIControlStateNormal];
    
    label.text = CustomLocalizedString(@"ok", nil);
}

-(void)didClickChinese
{
    if (![[[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage]isEqualToString:@"zh-Hans"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:AppLanguage];
        NSString *str = CustomLocalizedString(@"ok",nil);
        NSLog(@"%@",str);
    }
    TwoViewController *twoVc = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:twoVc animated:YES];
}

-(void)didClickEnglish
{
    if (![[[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage]isEqualToString:@"en"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:AppLanguage];
        NSString *str = CustomLocalizedString(@"ok",nil);
        NSLog(@"%@",str);
    }
    TwoViewController *twoVc = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:twoVc animated:YES];
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
