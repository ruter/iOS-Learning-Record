//
//  ViewController.m
//  UIPickerView
//
//  Created by Ruter on 16/2/2.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIPickerView *myPickerView;
@property (nonatomic, strong) NSArray *ds1;
@property (nonatomic, strong) NSArray *ds2;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 实例化PickerView
  self.myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 260)];
  
  // 设置数据源及代理
  self.myPickerView.dataSource = self;
  self.myPickerView.delegate = self;
  
  // 数据
  self.ds1 = @[@"Fruit", @"Food", @"Drink"];
  self.ds2 = @[@"Fruit", @"Food"];
  
  // 添加到视图
  [self.view addSubview:self.myPickerView];
  
}

#pragma mark - DataSource & Delegate
// 列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 2;
}
// 行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  if (component == 0) {
    return self.ds1.count;
  } else if (component == 1) {
    return self.ds2.count;
  } else {
    return 1;
  }
//  return self.ds1.count;
}
// 绑定数据源
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  if (component == 0) {
    return [self.ds1 objectAtIndex:row];
  } else if (component == 1) {
    return [self.ds2 objectAtIndex:row];
  } else {
    return @"";
  }
}
// 返回一个View
//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
//  UILabel *lb;
//  if (view != nil) {
//    lb = (UILabel *)view;
//  } else {
//    lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 100, 32)];
//  }
//  lb.text = [self.ds1 objectAtIndex:row];
//  return  lb;
//}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
