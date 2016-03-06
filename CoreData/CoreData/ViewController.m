//
//  ViewController.m
//  CoreData
//
//  Created by Ruter on 16/3/6.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"
#import "CDUtil.h"

@interface ViewController ()

@property (nonatomic, strong) CDUtil *util;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.util = [[CDUtil alloc] init];
}

- (IBAction)add:(id)sender {
  [self.util addCustomer];
}

- (IBAction)query:(id)sender {
  [self.util query];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
