//
//  ViewController.m
//  UIButton
//
//  Created by Ruter on 16/2/1.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *myButton;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 实例化按钮并设置标题
  self.myButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [self.myButton setTitle:@"Click!" forState:UIControlStateNormal];
  
  // 为按钮添加响应事件
  [self.myButton addTarget:self action:@selector(btnMethod) forControlEvents:UIControlEventTouchUpInside];
  
  // 添加按钮到视图
  self.myButton.frame = CGRectMake(100, 100, 64, 16);
  [self.view addSubview:self.myButton];
}

// 按钮的响应事件
-(void)btnMethod {
  
  NSLog(@"myButton touched.");
  // 获取按钮的属性
  NSLog(@"currentTitle: %@", [self.myButton currentTitle]);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
