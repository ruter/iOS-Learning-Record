//
//  MyAnnotation.m
//  PinMap
//
//  Created by Ruter on 16/3/8.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

-(instancetype)initWith:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubTitle:(NSString *)subTitle {
  self = [super init];
  if (self) {
    _coordinate = coordinate;
    _title = title;
    _subtitle = subTitle;
  }
  return self;
}

@end
