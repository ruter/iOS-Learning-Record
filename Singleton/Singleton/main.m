//
//  main.m
//  Singleton
//
//  Created by Ruter on 16/1/29.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
  
    Singleton *obj1 = [[Singleton alloc] init];
    Singleton *obj2 = [[Singleton alloc] init];
    
    Singleton *obj3 = [Singleton shareInstance];
    Singleton *obj4 = [Singleton shareInstance];
    
    // 输出查看是否为同一个对象
    NSLog(@"\n%@\n%@\n%@\n%@", obj1, obj2, obj3, obj4);
    
  }
  return 0;
}
