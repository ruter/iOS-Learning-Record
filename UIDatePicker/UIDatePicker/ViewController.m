//
//  ViewController.m
//  UIDatePicker
//
//  Created by Ruter on 16/2/2.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDatePicker *myDatePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 实例化DatePicker
  self.myDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 160)];
  
  // 设置为只选取日期
  self.myDatePicker.datePickerMode = UIDatePickerModeDate;
  
  // 绑定事件
  [self.myDatePicker addTarget:self action:@selector(showDate:) forControlEvents:UIControlEventValueChanged];
  
  // 添加到视图
  [self.view addSubview:self.myDatePicker];
}

// 日期改变时打印出来
-(void)showDate:(UIDatePicker *)datePicker {
  NSLog(@"%@", datePicker.date);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
