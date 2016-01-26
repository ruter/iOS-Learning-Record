//
//  Switch.h
//  Protocol
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Switch <NSObject>

// 必须实现的方法
@required
-(void)turnOn;
-(void)turnOff;

// 可选的方法
@optional
-(void)fixIt;

@end
