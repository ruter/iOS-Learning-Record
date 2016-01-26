//
//  main.m
//  Predicate
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Person *p1 = [[Person alloc] init];
    Person *p2 = [[Person alloc] init];
    Person *p3 = [[Person alloc] init];
    Person *p4 = [[Person alloc] init];
    
    p1.name = @"Bob";
    p1.age = 20;
    p2.name = @"Tyler";
    p2.age = 22;
    p3.name = @"Lily";
    p3.age = 21;
    p4.name = @"Bob";
    p4.age = 19;
    
    
    NSArray *pArray = @[p1, p2, p3, p4];
    
    // 创建断言
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name == %@", @"Bob"];
    
    // 用%K占位代替固定的属性名
    // NSPredicate *pre = [NSPredicate predicateWithFormat:@"%K == %@", @"name", @"Bob"];
     
    // BETWEEN关键字用于过滤某一区间值
    // NSPredicate *pre = [NSPredicate predicateWithFormat:@"age BETWEEN {20, 30}"];
    // 用数组代替固定区间
    // NSArray *section = @[[NSNumber numberWithInt:20], [NSNumber numberWithInt:30]];
    // NSPredicate *pre = [NSPredicate predicateWithFormat:@"age BETWEEN %@", section];
    
    
    pArray = [pArray filteredArrayUsingPredicate:pre];
    
    NSLog(@"%@", pArray);
    
    NSLog(@"---------------");
    
    // 非对象实例的集合
    NSArray *nArray = @[@"Bob", @"Tom1", @"Tyler", @"Lily", @"Little Tyler", @"Tom2"];
    
    NSPredicate *pre2 = [NSPredicate predicateWithFormat:@"SELF == %@", @"Tyler"];
    
    // 利用LIKE关键字和通配符?或者*匹配
    // NSPredicate *pre2 = [NSPredicate predicateWithFormat:@"SELF LIKE Tom?"];
    // NSPredicate *pre2 = [NSPredicate predicateWithFormat:@"SELF LIKE *Tyler"];
    
    // 利用BEGINSWITH和ENDSWITH匹配以某字符串开头或结尾的内容
    // NSPredicate *pre2 = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", @"Li"];
    // NSPredicate *pre2 = [NSPredicate predicateWithFormat:@"SELF ENDSWITH %@", @"Tyler"];
    
    // 利用关键字CONTAINS过滤包含某字符串的内容
    // NSPredicate *pre2 = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", @"o"];
    
    nArray = [nArray filteredArrayUsingPredicate:pre2];
    
    NSLog(@"%@", nArray);
    
    
  }
    return 0;
}
