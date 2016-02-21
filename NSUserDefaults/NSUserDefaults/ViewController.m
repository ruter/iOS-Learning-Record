//
//  ViewController.m
//  NSUserDefaults
//
//  Created by Ruter on 16/2/21.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)write:(id)sender {
  // 实例化持久化对象
  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  
  // 设置键值对
  [userDefault setInteger:23 forKey:@"intKey"];
  [userDefault setFloat:2.33 forKey:@"floatKey"];
  [userDefault setBool:NO forKey:@"boolKey"];
  [userDefault setObject:@"String" forKey:@"strKey"];
  // 同步到持久状态
  [userDefault synchronize];
  
  NSLog(@"Done!");
}

- (IBAction)read:(id)sender {
  
  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  // 读取键值对
  NSInteger i = [userDefault integerForKey:@"intKey"];
  float f = [userDefault floatForKey:@"floatKey"];
  BOOL b = [userDefault boolForKey:@"boolKey"];
  NSString *str = [userDefault objectForKey:@"strKey"];
  
  NSLog(@"\nintKey = %lu\nfloatKey = %f\nboolKey = %d\nstrKey = %@", i, f, b, str);
}

/*
 1. 运行后打开设置
 2. 拉到底部打开以项目名称命名的选项
 3. 修改设置后返回运行的项目获取设置
 4. 再次修改后获取设置
 */
- (IBAction)getSettings:(id)sender {
  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  // 读取配置
  NSString *name = [userDefault stringForKey:@"name_preference"];
  BOOL enable = [userDefault boolForKey:@"enabled_preference"];
  float slider = [userDefault floatForKey:@"slider_preference"];
  
  NSLog(@"\nname = %@\nenable = %d\nslider = %f", name, enable, slider);
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
