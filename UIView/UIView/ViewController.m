//
//  ViewController.m
//  UIView
//
//  Created by Ruter on 16/1/31.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *blueView, *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.view.backgroundColor = [UIColor grayColor];
  
  // 将blueView添加到相对父视图(self.view)坐标轴为(50, 50)的位置
  self.blueView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 250, 250)];
  self.blueView.backgroundColor = [UIColor blueColor];
  [self.view addSubview:self.blueView];
  
  // 将redView添加到相对父视图(blueView)坐标轴为(20, 20)的位置
  self.redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
  self.redView.backgroundColor = [UIColor redColor];
  [self.blueView addSubview:self.redView];
  
  
  // 输出blueView自身坐标起点及尺寸
  NSLog(@"self.blueView x - %f, y - %f, width - %f, height - %f", self.blueView.bounds.origin.x, self.blueView.bounds.origin.y, self.blueView.bounds.size.width, self.blueView.bounds.size.height);  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
