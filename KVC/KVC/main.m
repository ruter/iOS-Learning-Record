//
//  main.m
//  KVC
//
//  Created by Ruter on 16/1/27.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Person *p = [[Person alloc] init];
    // 用.方法设置属性值
    // self.name = @"Tyler";
    // self.age = 25;
    
    // 用KVC的方法设置属性值
    [p setValue:@"Tyler" forKey:@"name"];
    [p setValue:[NSNumber numberWithInt:25] forKey:@"age"];
    
    
    p.person = [[Person alloc] init];
    // 用.方法设置多级属性值
    // p.person.name = @"Tom";
    
    // 用KVC的方式设置多级属性值
    [p setValue:@"Tom" forKeyPath:@"person.name"];
    
    // 用KVC方式获取属性值
    NSString *name = [p valueForKey:@"name"];
    int age = [[p valueForKey:@"age"] intValue];
    
    NSString *pName = [p valueForKeyPath:@"person.name"];
    
    
    NSLog(@"%@, %d, %@", name, age, pName);
    
  }
    return 0;
}
