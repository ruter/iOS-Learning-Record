//
//  ViewController.m
//  UICollectionView
//
//  Created by Ruter on 16/2/4.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UICollectionView *myCollectionView;

@end

static NSString *cid = @"cid";

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  // 创建布局对象
  UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
  
  // 实例化CollectionView
  self.myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width - 40, self.view.frame.size.height - 60) collectionViewLayout:flow];
  
  // 注册重用ID
  [self.myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cid];
  
  // 设置代理及数据源
  self.myCollectionView.delegate = self;
  self.myCollectionView.dataSource = self;
  
  // 添加到视图
  [self.view addSubview:self.myCollectionView];
  
}

#pragma mark - DataSource & Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 88;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cid forIndexPath:indexPath];
  
  cell.backgroundColor = [UIColor blueColor];
  
  return cell;
}

// 设置cell的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(10, 10, 10, 10);
}

// 设置cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(150, 150);
}

// 设置选中事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  
  cell.backgroundColor = [UIColor grayColor];
  
  NSLog(@"Index %lu clicked!", indexPath.row);
  
}

// 设置取消选择事件
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
  
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
  
  cell.backgroundColor = [UIColor blueColor];
  
  NSLog(@"Index %lu unClicked!", indexPath.row);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
