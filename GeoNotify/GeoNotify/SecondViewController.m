//
//  SecondViewController.m
//  GeoNotify
//
//  Created by Ruter on 16/3/13.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "SecondViewController.h"
#import "CusAnnotation.h"
#import <CoreLocation/CoreLocation.h>

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CusAnnotation *pin;
@property (nonatomic, strong) CLGeocoder *geoCoder;

@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.mapView.delegate = self;
  
  self.title = @"New";
  NSLog(@"Second");
  // Add gesture recognizer
  UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
  longPress.minimumPressDuration = 0.3;
  [self.mapView addGestureRecognizer:longPress];
  
  self.geoCoder = [[CLGeocoder alloc] init];
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer {
  if (gestureRecognizer.state != UIGestureRecognizerStateBegan) {
    return;
  }
  // Convert point to coordinate
  CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
  CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
  
  // Set annotation
  MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
  point.coordinate = touchMapCoordinate;
  
  // Clear other pins/annotations
  for (id annotation in self.mapView.annotations) {
    [self.mapView removeAnnotation:annotation];
  }
  // Set annotation
  [self.geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
    if (placemarks.count > 0 && error == nil) {
      CLPlacemark *mark = [placemarks objectAtIndex:0];
      NSLog(@"Address: %@, Name: %@", mark.locality, mark.name);
      // Set pin
      self.pin = [[CusAnnotation alloc] initWith:touchMapCoordinate andTitle:mark.locality andSubTitle:mark.name];
      // Pin on map
      [self.mapView addAnnotation:self.pin];
    }
  }];
  // Set region scale
  MKCoordinateRegion region;
  region.center.latitude = point.coordinate.latitude;
  region.center.longitude = point.coordinate.longitude;
  
  region.span.latitudeDelta = 0.01;
  region.span.longitudeDelta = 0.01;
  self.mapView.region = region;
}

#pragma mark - MKMapViewDelegate

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  MKPinAnnotationView *pin = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
  if (pin == nil) {
    pin = [[MKPinAnnotationView alloc] initWithAnnotation:self.pin reuseIdentifier:@"pin"];
  } else {
    pin.annotation = self.pin;
  }
  pin.animatesDrop = YES;
  pin.draggable = YES;
  pin.canShowCallout = YES;
  
  return pin;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
  if (newState == MKAnnotationViewDragStateEnding) {
    // Set annotation
    [self.geoCoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      if (placemarks.count > 0 && error == nil) {
        CLPlacemark *mark = [placemarks objectAtIndex:0];
        NSLog(@"Address: %@, Name: %@", mark.locality, mark.name);
        [self.pin setTitle:mark.locality];
        [self.pin setSubtitle:mark.name];
      }
    }];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
