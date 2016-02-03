//
//  ViewController.m
//  UITableViewCell
//
//  Created by Ruter on 16/2/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "Fruit.h"
#import "FruitTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *fruitTableView;
@property (nonatomic, strong) NSMutableArray *ds;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 创建TableView
  self.fruitTableView = [[UITableView alloc] initWithFrame:self.view.frame];
  
  self.fruitTableView.dataSource = self;
  self.fruitTableView.delegate = self;
  
  // 从Model中获取数据
  self.ds = [[Model alloc] init].fruitList;
  
  
  [self.view addSubview:self.fruitTableView];
}

#pragma mark - DataSource & Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.ds.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cid = @"cid";
  FruitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
  
  if (cell == nil) {
    cell = [[FruitTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
  }
  Fruit *fruit = [self.ds objectAtIndex:indexPath.row];
  
//  cell.textLabel.text = fruit.name;
  cell.lbFid.text = [NSString stringWithFormat:@"FID: %d", fruit.fid];
  cell.lbName.text = [NSString stringWithFormat:@"%@", fruit.name];
  cell.lbWeight.text = [NSString stringWithFormat:@"%d kg", fruit.weight];
  cell.lbPrice.text = [NSString stringWithFormat:@"Price: $%d", fruit.price];
  
  return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 72;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
