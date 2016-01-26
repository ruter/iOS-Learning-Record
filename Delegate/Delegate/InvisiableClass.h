//
//  InvisiableClass.h
//  Delegate
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlertDelegate.h"

@interface InvisiableClass : NSObject

@property (nonatomic, weak) id<AlertDelegate> delegate;

-(void)startTimer;

@end
