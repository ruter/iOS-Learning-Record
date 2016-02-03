//
//  Model.m
//  UITableViewCell
//
//  Created by Ruter on 16/2/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Model.h"
#import "Fruit.h"

@implementation Model
// 初始化创建数据
-(instancetype)init {
  self = [super init];
  if (self) {
    self.fruitList = [NSMutableArray arrayWithCapacity:5];
    for (int i = 1; i <= 10; i++) {
      Fruit *fruit = [[Fruit alloc] init];
      
      fruit.fid = i;
      fruit.weight = i * 5;
      fruit.price = i * 2;
      fruit.name = [NSString stringWithFormat:@"Fruit %d", i];
    
      [self.fruitList addObject:fruit];
    }
  }
  return self;
}

@end
