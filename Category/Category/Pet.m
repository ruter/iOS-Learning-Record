//
//  Pet.m
//  Category
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Pet.h"

@implementation Pet

-(instancetype)init {
  self = [super init];
  if (self) {
    self.name = @"";
    self.age = 0;
  }
  return self;
}

-(void)aboutPet {
  NSLog(@"I'm called %@, %d-year old now.", _name, _age);
}

-(void)petYellWith:(NSString *)yell {
  NSLog(@"%@~%@~", yell, yell);
}

@end
