//
//  Singleton.m
//  Singleton
//
//  Created by Ruter on 16/1/29.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

// 创建单例的实例对象
static Singleton *_instance = nil;

// 单例类方法的实现
+(instancetype)shareInstance {
  
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    _instance = [[super allocWithZone:NULL] init];
  });
  return _instance;
}

// 重载 allocWithZone 方法
+(instancetype)allocWithZone:(struct _NSZone *)zone {
  
  return [Singleton shareInstance];
}
// 重载 copyWithZone 方法
-(id)copyWithZone:(struct _NSZone *)zone {
  
  return [Singleton shareInstance];
}
// 重载 mutableCopyWithZone 方法
-(id)mutableCopyWithZone:(struct _NSZone *)zone {

  return [Singleton shareInstance];
}

@end
