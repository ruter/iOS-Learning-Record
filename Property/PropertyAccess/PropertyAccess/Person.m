//
//  Person.m
//  PropertyAccess
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Person.h"

@implementation Person
/*
// 实例变量（仅类内可以访问）
{
  NSString *_name;
  int _age;
}
*/

// Init
-(instancetype)init {
  self = [super init];
  if (self) {
    self.name = @"";
    self.age = 0;
  }
  return self;
}

+(void)sayHello {
  // 类方法不能访问实例变量
  // NSLog(@"Hello! This is %@, %d years old.", _name, _age);
  
  // 类方法用于完成一些无需访问实例变量的操作
  NSLog(@"Hello!");
}

// 对象方法可以访问实例变量
-(void)sayHi {
  NSLog(@"Hi! I'm %@, %d years old.", _name, _age);
}

@end
