//
//  Pet+Bird.m
//  Category
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Pet+Bird.h"

@implementation Pet (Bird)

-(void)flyWith:(BOOL)wings {
  if (wings) {
    NSLog(@"I can fly!");
  } else {
    NSLog(@"No! I can't fly!!");
  }
}

@end
