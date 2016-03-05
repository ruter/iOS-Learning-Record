//
//  ViewController.m
//  FMDB
//
//  Created by Ruter on 16/3/5.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"
#import "DBUtil.h"

@interface ViewController ()
@property(nonatomic, strong) DBUtil *util;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.util = [[DBUtil alloc] init];
  [self.util createDb];
  [self.util createTable];
}

- (IBAction)add:(id)sender {
  [self.util add];
}

- (IBAction)query:(id)sender {
  [self.util query];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
