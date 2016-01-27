//
//  ViewController.m
//  KVO
//
//  Created by Ruter on 16/1/27.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

// Context标示符，当监听多个对象时，若有相同的Key则会同时响应，所以需要以Context作为区分
static void *firstLabel = &firstLabel;
static void *arrayContext = &arrayContext;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  [self addObserver:self forKeyPath:@"lbDisplay.text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:firstLabel];
  
  // 设置数组的监听
  self.array = [[NSMutableArray alloc] initWithArray:@[@"Bob", @"Jack", @"Tom", @"Lily", @"Jalice"]];
  [self addObserver:self forKeyPath:@"array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:arrayContext];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
  
  if (context == firstLabel) {
    if ([keyPath isEqualToString:@"lbDisplay.text"]) {
      // 监听到Label的内容发生变化，弹出警告框
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"KVO" message:@"Label changed!" preferredStyle:UIAlertControllerStyleAlert];
      
      [self presentViewController:alert animated:YES completion:nil];
      
      NSLog(@"Value changed - %@", change);
    }
  } else if (context == arrayContext) {
    if ([keyPath isEqualToString:@"array"]) {
      // 数组改变后打印查看
      NSLog(@"%@", change);
      for (id item in _array) {
        NSLog(@"%@", item);
      }
    }
  }
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)btnChange:(id)sender {
  [self setValue:@"Changed!" forKeyPath:@"lbDisplay.text"];
}

- (IBAction)btnChangeArr:(id)sender {
  [self insertObject:@"Tyler" inArrayAtIndex:3];
  [self removeObjectFromArrayAtIndex:2];
  [self replaceObjectInArrayAtIndex:3 withObject:@"Little Tyler"];
}

#pragma mark - Array KVC methods
-(NSUInteger)countOfArray {
  return self.array.count;
}

-(id)objectInArrayAtIndex:(NSUInteger)index {
  return [self.array objectAtIndex:index];
}

-(void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index {
  [self.array insertObject:object atIndex:index];
}

-(void)removeObjectFromArrayAtIndex:(NSUInteger)index {
  [self.array removeObjectAtIndex:index];
}

-(void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object {
  [self.array replaceObjectAtIndex:index withObject:object];
}

@end
