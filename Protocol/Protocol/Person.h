//
//  Person.h
//  Protocol
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Switch.h"

@interface Person : NSObject

// 以实现了协议的类的对象作为参数传递，实现多态
-(void)turnOn:(id<Switch>)device;
-(void)turnOff:(id<Switch>)device;

@end
