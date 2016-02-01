//
//  ViewController.m
//  UISegmentedControl
//
//  Created by Ruter on 16/2/1.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UISegmentedControl *seg;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 实例化SegmentedControl
  self.seg = [[UISegmentedControl alloc] initWithItems:@[@"One", @"Two", @"Three", @"Four"]];
  
  // 设置坐标及尺寸并添加到主视图
  self.seg.frame = CGRectMake(100, 100, 200, 24);
  [self.view addSubview:self.seg];
  
  // 绑定值改变时触发的事件
  [self.seg addTarget:self action:@selector(changeSeg:) forControlEvents:UIControlEventValueChanged];
  
}

// 当值改变时输出点选的索引值
- (IBAction)changeSeg:(UISegmentedControl *)sender {

  NSInteger index = sender.selectedSegmentIndex;
  
  NSLog(@"Selected index - %ld", (long)index);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
