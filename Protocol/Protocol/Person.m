//
//  Person.m
//  Protocol
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)turnOn:(id<Switch>)device {
  [device turnOn];
}

-(void)turnOff:(id<Switch>)device {
  [device turnOff];
}

@end
