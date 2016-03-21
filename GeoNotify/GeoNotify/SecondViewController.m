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
#import "DBUtil.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CusAnnotation *pin;
@property (nonatomic, strong) CLGeocoder *geoCoder;
@property (weak, nonatomic) IBOutlet UITextField *txfAddress;
@property (nonatomic, strong) UIBarButtonItem *btnDone;
@property (weak, nonatomic) IBOutlet UITextField *txfDescribe;
@property (nonatomic, strong) DBUtil *db;

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
  
  // Add bar button
  self.btnDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(btnDone:)];
  self.btnDone.enabled = NO;
  [self.navigationItem setRightBarButtonItem:self.btnDone];
  
  self.geoCoder = [[CLGeocoder alloc] init];
  
  self.db = [[DBUtil alloc] init];
  [self.db createDb];
  [self.db createTable];
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
      
      self.btnDone.enabled = YES;
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

// Pin on map use address
- (IBAction)btnPin:(id)sender {
  NSString *address = self.txfAddress.text;
  if (address == nil || address.length == 0) {
    return;
  }
  // Clear other pins/annotations
  for (id annotation in self.mapView.annotations) {
    [self.mapView removeAnnotation:annotation];
  }
  // Translate the address to coordinate
  [self.geoCoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
    if (placemarks.count > 0 && error == nil) {
      CLPlacemark *mark = [placemarks objectAtIndex:0];
      NSLog(@"Latitude: %f, Longitude: %f", mark.location.coordinate.latitude, mark.location.coordinate.longitude);
      // Set region scale
      MKCoordinateRegion region;
      region.center.latitude = mark.location.coordinate.latitude;
      region.center.longitude = mark.location.coordinate.longitude;
    
      region.span.latitudeDelta = 0.01;
      region.span.longitudeDelta = 0.01;
      self.mapView.region = region;
      // Set annotation
      self.pin = [[CusAnnotation alloc] initWith:mark.location.coordinate andTitle:mark.locality andSubTitle:mark.name];
      [self.mapView addAnnotation:self.pin];
      self.btnDone.enabled = YES;
    }
  }];
}
// Bar button's action
- (void)btnDone:(id)sender {
  NSLog(@"Address: %@, Coord: (%f, %f)", self.pin.subtitle, self.pin.coordinate.latitude, self.pin.coordinate.longitude);
  NSLog(@"Describe: %@", self.txfDescribe.text);
  [self.db add:self.pin.subtitle andLatitude:self.pin.coordinate.latitude andLongitude:self.pin.coordinate.longitude andDescribe:self.txfDescribe.text];
  [self.db query];
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
