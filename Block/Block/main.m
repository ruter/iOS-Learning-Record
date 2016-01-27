//
//  main.m
//  Block
//
//  Created by Ruter on 16/1/27.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    // 没有返回值和参数列表的块
    void (^voidBlock)(void);
    voidBlock = ^(void) {
      NSLog(@"This block have no return type & arguments.");
    };
    // 没有参数列表可以省略掉实现的(void)列表
//    voidBlock = ^{
//      NSLog(@"This block have no return type & arguments.");
//    };
    
    // 有返回类型及参数列表的块
    NSString* (^strBlock)(NSString*, int) = strBlock = ^(NSString *name, int age) {
      return [NSString stringWithFormat:@"I'm %@, %d-year-old now.", name, age];
    };
    
    // 把块定义成类型
    typedef void (^MyBlock)(void);
    
    MyBlock newBlock = ^(void) {
      NSLog(@"This is a new block.");
    };
    
    // 测试
    voidBlock();
    
    NSLog(@"%@", strBlock(@"Tyler", 25));
    
    newBlock();
    
    
    
    // 关于块内变量的使用
    int a = 10;
    static int b = 20;
    __block int c = 30;
    
    typedef void (^VarBlock)(void);
    
    VarBlock aBlock = ^{
      // 这里会报错，外部变量在块内引用会变成const类型，无法改变值
      // a += 1;
      NSLog(@"Variable a is %d now.", a);
    };
    
    VarBlock bBlock = ^{
      // static变量在块内可以进行修改及保存值
      b += 10;
      NSLog(@"Variable b is %d now.", b);
    };
    
    VarBlock cBlock = ^{
      // 在变量前加__block变成块变量，可以在块内修改及保存值
      c += 5;
      NSLog(@"Variable c is %d now.", c);
    };
    
    aBlock();
    bBlock();
    cBlock();
    // 输出a，b，c变量的值看是否改变
    NSLog(@"a = %d, b = %d, c = %d", a, b, c);
    
    
  }
    return 0;
}
