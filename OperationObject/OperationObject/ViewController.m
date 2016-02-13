//
//  ViewController.m
//  OperationObject
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

- (IBAction)start:(id)sender {
  NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loop) object:nil];
  // 创建并添加操作队列
  NSOperationQueue *q = [[NSOperationQueue alloc] init];
  [q addOperation:op];
  
  NSLog(@"NSInvocationOperation END");
}

- (IBAction)block:(id)sender {
  NSBlockOperation *bop = [NSBlockOperation blockOperationWithBlock:^{
    [self loop];
  }];
  
  NSOperationQueue *q = [[NSOperationQueue alloc] init];
  [q addOperation:bop];

  NSLog(@"NSBlockOperation END");
}

-(void)loop {
  for (int i = 1; i <= 10; i++) {
    [NSThread sleepForTimeInterval:1];
    NSLog(@"i = %d", i);
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
