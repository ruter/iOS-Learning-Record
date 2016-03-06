//
//  CDUtil.m
//  CoreData
//
//  Created by Ruter on 16/3/6.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "CDUtil.h"
#import "AppDelegate.h"
#import "Customer.h"

@implementation CDUtil

-(instancetype)init {
  self = [super init];
  if (self) {
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *delegate = app.delegate;
    self.context = delegate.managedObjectContext;
  }
  return self;
}

-(void)addCustomer {
  // 使用NSEntityDescription的静态方法创建一个对象
  Customer *c = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:self.context];
  
  if (c != nil) {
    // 赋值
    c.age = [NSNumber numberWithInt:20];
    c.name = @"Tyler";
    c.email = @"tyler@domain.com";
    // 保存
    BOOL result = [self.context save:nil];
    if (result) {
      NSLog(@"Save OK.");
    } else {
      NSLog(@"Save Fail.");
    }
  }
}

-(void)query {
  // 实例化NSFetchRequest
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  // 实例化NSEntityDescription
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:self.context];
  // 为查询对象设置实体
  [request setEntity:entity];
  // 执行查询
  NSArray *customers = [self.context executeFetchRequest:request error:nil];
  // 输出
  for (Customer *c in customers) {
    NSLog(@"name = %@, age = %@, email = %@", c.name, c.age, c.email);
  }
}
@end
