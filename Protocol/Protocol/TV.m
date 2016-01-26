//
//  TV.m
//  Protocol
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "TV.h"

@implementation TV

// 实现@required方法
-(void)turnOn {
  NSLog(@"Turn on the TV.");
}

-(void)turnOff {
  NSLog(@"Turn off the TV.");
}

// 实现@optional方法
-(void)fixIt {
  NSLog(@"Fix TV.");
}

@end
