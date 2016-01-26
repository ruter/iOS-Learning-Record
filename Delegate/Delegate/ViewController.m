//
//  ViewController.m
//  Delegate
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  InvisiableClass *timer = [[InvisiableClass alloc] init];
  
  // 设置代理实例
  timer.delegate = self;
  
  // 开启计时器
  [timer startTimer];
  
}

-(void)showAlert {
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"DelegateDemo" message:@"This is a demo to show how delegate work." preferredStyle:UIAlertControllerStyleAlert];
  
  [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
