//
//  CusAnnotation.h
//  GeoNotify
//
//  Created by Ruter on 16/3/14.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CusAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

-(instancetype)initWith:(CLLocationCoordinate2D)coordinate andTitle:(NSString *)title andSubTitle:(NSString *)subTitle;

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

-(void)setTitle:(NSString *)title;

-(void)setSubtitle:(NSString *)subtitle;

@end
