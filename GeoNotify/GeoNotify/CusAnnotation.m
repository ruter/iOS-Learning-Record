//
//  CusAnnotation.m
//  GeoNotify
//
//  Created by Ruter on 16/3/14.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "CusAnnotation.h"

@implementation CusAnnotation

-(instancetype)initWith:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubTitle:(NSString *)subTitle {
  
  self = [super init];
  
  if (self) {
    _coordinate = coordinate;
    _title = title;
    _subtitle = subTitle;
  }
  return self;
}

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
  _coordinate = newCoordinate;
}

-(void)setTitle:(NSString *)title {
  _title = title;
}

-(void)setSubtitle:(NSString *)subtitle {
  _subtitle = subtitle;
}
@end
