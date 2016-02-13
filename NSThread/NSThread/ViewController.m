//
//  ViewController.m
//  NSThread
//
//  Created by Ruter on 16/2/13.
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

- (IBAction)single:(id)sender {
  [self loop];
  
  NSLog(@"--- single END ---");
}

- (IBAction)mutiple:(id)sender {
  // 创建线程
  NSThread *t = [[NSThread alloc] initWithTarget:self selector:@selector(loop) object:nil];
  // 启动线程
  [t start];
  
  NSLog(@"--- mutiple END ---");
}

- (IBAction)detach:(id)sender {
  // 直接创建线程并启动
  [NSThread detachNewThreadSelector:@selector(loop) toTarget:self withObject:nil];
  
  NSLog(@"--- detach END ---");
}

- (void)loop{
  for (int i = 1; i <= 10; i++) {
    NSLog(@"i = %d", i);
    // 线程休眠1s
    [NSThread sleepForTimeInterval:1];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
