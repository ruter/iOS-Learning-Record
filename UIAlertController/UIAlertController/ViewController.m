//
//  ViewController.m
//  UIAlertController
//
//  Created by Ruter on 16/2/1.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIAlertController *actionSheet;
@property (strong, nonatomic) UIAlertController *alertView;
@property (strong, nonatomic) UIAlertController *alertField;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 创建ActionSheet
  self.actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Test action sheet." preferredStyle:UIAlertControllerStyleActionSheet];
  
  // 创建Action
  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
    NSLog(@"Action OK");
    [self.actionSheet dismissViewControllerAnimated:YES completion:nil];
  }];
  UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
    NSLog(@"Action Cancel");
    [self.actionSheet dismissViewControllerAnimated:YES completion:nil];
  }];
  
  // 为ActionSheet添加Actions
  [self.actionSheet addAction:ok];
  [self.actionSheet addAction:cancel];
  
  
  
  // 创建普通AlertView(没有按钮)
  self.alertView = [UIAlertController alertControllerWithTitle:@"Alert View" message:@"Test alert view." preferredStyle:UIAlertControllerStyleAlert];
  
  // 为AlertView添加Actions(使用之前创建的两个Action)
  [self.alertView addAction:ok];
  [self.alertView addAction:cancel];
  
  
  
  // 创建带有Field的AlertView并添加Actions
  self.alertField = [UIAlertController alertControllerWithTitle:@"Alert View With Fields" message:@"Test alert view with fields." preferredStyle:UIAlertControllerStyleAlert];
  
  [self.alertField addAction:ok];
  [self.alertField addAction:cancel];
  
  // 添加输入框
  [self.alertField addTextFieldWithConfigurationHandler:^(UITextField * textField) {
    textField.placeholder = @"Username";
  }];
  [self.alertField addTextFieldWithConfigurationHandler:^(UITextField * textField) {
    textField.placeholder = @"Password";
    textField.secureTextEntry = YES;
  }];
}


// 点击按钮显示ActionSheet
- (IBAction)btnShow:(id)sender {
  [self presentViewController:self.actionSheet animated:YES completion:nil];
}
// 点击按钮显示AlertView
- (IBAction)btnAlert:(id)sender {
  [self presentViewController:self.alertView animated:YES completion:nil];
}
// 点击按钮显示带有Field的AlertView
- (IBAction)btnField:(id)sender {
  [self presentViewController:self.alertField animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
