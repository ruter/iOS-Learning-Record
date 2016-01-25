//
//  main.m
//  PropertyAccess
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Person *p = [[Person alloc] init];
    
    // 在类外对属性进行访问
    p.name = @"Tyler";
    p.age = 20;
    
    // 类外不能对实例变量进行访问
    // p._name = @"Tyler";
    // p._age = 20;
    
    // 调用对象方法
    [p sayHi];
    
    // 调用类方法
    [Person sayHello];
    
  }
  return 0;
}
