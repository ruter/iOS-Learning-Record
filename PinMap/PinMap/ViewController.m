//
//  ViewController.m
//  PinMap
//
//  Created by Ruter on 16/3/8.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pin:(id)sender {
  MyAnnotation *a = [[MyAnnotation alloc] initWith:CLLocationCoordinate2DMake(35.1, 115.12) andTitle:@"Title" andSubTitle:@"SubTitle"];
  
//  a.coordinate = CLLocationCoordinate2DMake(35.1, 115.12);
  // 在地图上Pin出来
  [self.mapView addAnnotation:a];
  
  MKCoordinateRegion region;
  region.center.latitude = 35.1;
  region.center.longitude = 115.12;
  // 设置缩放比例
  region.span.latitudeDelta = 10;
  region.span.longitudeDelta = 10;
  self.mapView.region = region;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
