//
//  Person.h
//  PropertyAccess
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 定义属性
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;
// 类方法
+(void)sayHello;
// 对象方法
-(void)sayHi;

@end
