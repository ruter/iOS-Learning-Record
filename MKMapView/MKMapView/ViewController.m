//
//  ViewController.m
//  MKMapView
//
//  Created by Ruter on 16/3/7.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.mapView.delegate = self;
}

- (IBAction)mapType:(id)sender {
  UISegmentedControl *sc = (UISegmentedControl *)sender;
  NSInteger index = sc.selectedSegmentIndex;
  switch (index) {
    case 0:
      self.mapView.mapType = MKMapTypeStandard;
      break;
    case 1:
      self.mapView.mapType = MKMapTypeSatellite;
      break;
    case 2:
      self.mapView.mapType = MKMapTypeHybrid;
      break;
      
    default:
      break;
  }
}

-(void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
  NSLog(@"Start loading map...");
}

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
  NSLog(@"Finish loading map.");
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
