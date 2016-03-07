//
//  ViewController.m
//  CLLocationManager
//
//  Created by Ruter on 16/3/7.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.manager = [[CLLocationManager alloc] init];
  self.manager.delegate = self;
  
  if ([CLLocationManager locationServicesEnabled]) {
    NSLog(@"Services enabled!");
    // 精确度
    self.manager.desiredAccuracy = 1;
    // 更新距离
    self.manager.distanceFilter = 5;
  } else {
    NSLog(@"Services disabled!");
  }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  if (locations.count > 0) {
    CLLocation *loc = [locations objectAtIndex:0];
    NSLog(@"latitude: %f, longitude: %f", loc.coordinate.latitude, loc.coordinate.longitude);
  }
  NSLog(@"did update.");
}

- (IBAction)locate:(id)sender {
  [self.manager startUpdatingLocation];
  NSLog(@"Start updating...");
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
