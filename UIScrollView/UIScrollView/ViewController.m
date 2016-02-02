//
//  ViewController.m
//  UIScrollView
//
//  Created by Ruter on 16/2/2.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 实例化ScrollView，与主视图同样大小
  self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  
  // 实例化ImageView
  self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 650, 1280)];
//  self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scanpie.png"]];
  self.imgView.image = [UIImage imageNamed:@"scanpie.png"];
  self.imgView.backgroundColor = [UIColor grayColor];
  
  // 设置ScrollView内容大小 **很重要**
  self.myScrollView.contentSize = self.imgView.bounds.size;
  
  // 添加到视图中
  [self.myScrollView addSubview:self.imgView];
  [self.view addSubview:self.myScrollView];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
