//
//  Person.m
//  Predicate
//
//  Created by Ruter on 16/1/26.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
  return [NSString stringWithFormat:@"%@ - %d", _name, _age];
}

@end
