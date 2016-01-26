//
//  InvisiableClass.m
//  Delegate
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "InvisiableClass.h"

@implementation InvisiableClass

-(void)startTimer {
  [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(timerProc) userInfo:nil repeats:NO];
}

-(void)timerProc {
  // 由代理对象执行
  [_delegate showAlert];
}

@end
