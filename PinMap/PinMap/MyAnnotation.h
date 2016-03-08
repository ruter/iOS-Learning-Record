//
//  MyAnnotation.h
//  PinMap
//
//  Created by Ruter on 16/3/8.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

-(instancetype)initWith:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubTitle:(NSString *)subTitle;

@end
