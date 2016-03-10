//
//  ViewController.m
//  CLGeocoder
//
//  Created by Ruter on 16/3/10.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@property (nonatomic, strong) CLGeocoder *geoCoder;
@property (weak, nonatomic) IBOutlet UITextField *locate;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.geoCoder = [[CLGeocoder alloc] init];
}

- (IBAction)convert1:(id)sender {
  // 初始化一个经纬度位置信息
  CLLocation *loc = [[CLLocation alloc] initWithLatitude:39.904989 longitude:116.405285];
  // 经纬度转换为位置描述
  [self.geoCoder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
    if (placemarks.count > 0 && error == nil) {
      CLPlacemark *mark = [placemarks objectAtIndex:0];
      NSLog(@"Country: %@, Address: %@", mark.country, mark.locality);
    }
  }];
}

- (IBAction)convert2:(id)sender {
  // 位置描述转换为经纬度
  [self.geoCoder geocodeAddressString:self.locate.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
    if (placemarks.count > 0 && error == nil) {
      CLPlacemark *mark = [placemarks objectAtIndex:0];
      double latitude = mark.location.coordinate.latitude;
      double longitude = mark.location.coordinate.longitude;
//      CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
      NSLog(@"(%f, %f)", latitude, longitude);
    }
  }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
