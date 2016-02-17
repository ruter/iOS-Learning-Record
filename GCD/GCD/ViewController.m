//
//  ViewController.m
//  GCD
//
//  Created by Ruter on 16/2/18.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startPro:(id)sender {
  // 获取全局队列
  dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  // 异步任务
  dispatch_async(queue, ^{
    [self update];
  });
}

-(void)update {
  float p;
  while (p < 1) {
    p += 0.01;
    [NSThread sleepForTimeInterval:0.1];
    // 异步更新进度条
    dispatch_async(dispatch_get_main_queue(), ^{
      self.progressView.progress = p;
    });
  }
}
// GCD队列组
- (IBAction)startGroup:(id)sender {
  // 获取全局队列
  dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  // 创建队列组
  dispatch_group_t group = dispatch_group_create();
  
  dispatch_group_async(group, globalQueue, ^{
    NSLog(@"--- 1 Start --- %@", [NSThread currentThread]);
    // 延时5s模仿阻塞子线程
    [NSThread sleepForTimeInterval:5];
    NSLog(@"--- 1 End --- %@", [NSThread currentThread]);
  });
  
  dispatch_group_async(group, globalQueue, ^{
    NSLog(@"--- 2 Start --- %@", [NSThread currentThread]);
    // 延时5s模仿阻塞子线程
    [NSThread sleepForTimeInterval:5];
    NSLog(@"--- 2 End --- %@", [NSThread currentThread]);
  });
  
  // 此队列组里，会等group中的全部代码执行完毕再去执行其他操作
  dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    // 等待前面的异步操作都执行完毕后，回到主线程
    NSLog(@"All done!");
  });
  
  // 非ARC需要手动释放
  // dispatch_release(group);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
