//
//  ViewController.m
//  UITextField
//
//  Created by Ruter on 16/2/2.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *txfUsername;
@property (nonatomic, strong) UITextField *txfPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 实例化TextField
  self.txfUsername = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 250, 24)];
  self.txfPassword = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, 250, 24)];
  // 设置TextField属性
  self.txfUsername.borderStyle = UITextBorderStyleRoundedRect;
  self.txfUsername.placeholder = @"Username";
  self.txfUsername.clearButtonMode = UITextFieldViewModeWhileEditing;
  
  self.txfPassword.borderStyle = UITextBorderStyleRoundedRect;
  self.txfPassword.placeholder = @"Password";
  self.txfPassword.secureTextEntry = YES;
  
  
  // 加入视图
  [self.view addSubview:self.txfUsername];
  [self.view addSubview:self.txfPassword];
  
}

- (IBAction)done:(id)sender {
  
  NSLog(@"%@ - %@", self.txfUsername.text, self.txfPassword.text);
  [self.txfPassword resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
