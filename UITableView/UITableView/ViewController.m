//
//  ViewController.m
//  UITableView
//
//  Created by Ruter on 16/2/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *ds;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 实例化TableView
  self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  
  // 设置数据源及代理
  self.myTableView.dataSource = self;
  self.myTableView.delegate = self;
  
  // 添加数据
  self.ds = @[@"Bread", @"Drink", @"Fruit", @"Food", @"Bread", @"Drink", @"Fruit", @"Food", @"Bread", @"Drink", @"Fruit", @"Food", @"Bread", @"Drink", @"Fruit", @"Food", @"Bread", @"Drink", @"Fruit", @"Food", @"Bread", @"Drink", @"Fruit", @"Food"];
  
  // 添加到视图
  [self.view addSubview:self.myTableView];
}

#pragma mark - DataSource & Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.ds.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cid = @"cid";
  // cell重用
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
  // 实例化cell并设置数据
  if (cell == nil) {
    // 注意cell样式
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cid];
    // 测试重用 - 只有第一次创建的cell才会打印这句
    NSLog(@"New...");
  }
  // 设置cell的标签
  cell.textLabel.text = [self.ds objectAtIndex:indexPath.row];
  // 设置cell的图标
  if (indexPath.row % 2 == 0) {
    cell.imageView.image = [UIImage imageNamed:@"alarm.png"];
  } else {
    cell.imageView.image = [UIImage imageNamed:@"call.png"];
  }
  // 设置cell的detail
  cell.detailTextLabel.text = @"Something here...";
  
  // 测试重用
  NSLog(@"Hello...");
  return cell;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
