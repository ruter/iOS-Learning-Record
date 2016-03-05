//
//  ViewController.m
//  SQLite
//
//  Created by Ruter on 16/3/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"
#import "DBUtil.h"

@interface ViewController ()

@property(nonatomic, strong) DBUtil *util;

@property (weak, nonatomic) IBOutlet UITextField *txfName;
@property (weak, nonatomic) IBOutlet UITextField *txfPwd;

@property (weak, nonatomic) IBOutlet UITextField *txfPid;

@property (weak, nonatomic) IBOutlet UITextField *updPid;
@property (weak, nonatomic) IBOutlet UITextField *updName;
@property (weak, nonatomic) IBOutlet UITextField *updPwd;



@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.util = [[DBUtil alloc] init];
  
  sqlite3 *db = [self.util open];
  [self.util createTable:db];
  [self.util close:db];
}

- (IBAction)add:(id)sender {
  Person *per = [[Person alloc] init];
  per.name = self.txfName.text;
  per.pwd = self.txfPwd.text;
  
  [self.util insert:per];
}

- (IBAction)query:(id)sender {
  NSMutableArray *array = [self.util query];
  
  for (Person *per in array) {
    NSLog(@"pid = %d, name = %@, pwd = %@", per.pid, per.name, per.pwd);
  }
}

- (IBAction)del:(id)sender {
  int pid = [self.txfPid.text intValue];
  [self.util del:pid];
}

- (IBAction)find:(id)sender {
  int pid = [self.txfPid.text intValue];
  Person *per = [self.util findPerson:pid];
  
  NSLog(@"pid = %d, name = %@, pwd = %@", per.pid, per.name, per.pwd);
}

- (IBAction)update:(id)sender {
  Person *per = [[Person alloc] init];
  
  per.pid = [self.updPid.text intValue];
  per.name = self.updName.text;
  per.pwd = self.updPwd.text;
  
  [self.util update:per];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
