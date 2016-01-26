//
//  main.m
//  Protocol
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Light.h"
#import "TV.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
//    生成对象可以用对应的类，也可以用 id<Switch>
//    Light *light = [[Light alloc] init];
//    TV *tv = [[TV alloc] init];
    id<Switch> light = [[Light alloc] init];
    id<Switch> tv = [[TV alloc] init];
    
    
    Person *p = [[Person alloc] init];
    
    [p turnOn:light];
    [p turnOn:tv];
    
    [p turnOff:tv];
    [p turnOff:light];
    
  }
    return 0;
}
