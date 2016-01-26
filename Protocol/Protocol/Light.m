//
//  Light.m
//  Protocol
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Light.h"

@implementation Light

// 实现@required方法
-(void)turnOn {
  NSLog(@"Turn on the light.");
}

-(void)turnOff {
  NSLog(@"Turn off the light.");
}

// 这里没有实现 -(void)fixIt;方法，因为是可选的

@end
