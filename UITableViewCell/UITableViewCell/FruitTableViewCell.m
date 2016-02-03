//
//  FruitTableViewCell.m
//  UITableViewCell
//
//  Created by Ruter on 16/2/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "FruitTableViewCell.h"

@implementation FruitTableViewCell
// 重载初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    [self prepareLayout];
  }
  return self;
}

-(void)prepareLayout {
  self.lbFid = [[UILabel alloc] initWithFrame:CGRectMake(32, 0, 80, 32)];
  self.lbName = [[UILabel alloc] initWithFrame:CGRectMake(120, 0, 80, 32)];
  self.lbWeight = [[UILabel alloc] initWithFrame:CGRectMake(32, 40, 80, 32)];
  self.lbPrice = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 80, 32)];
  // 自定义cell，添加内容到contentView
  [self.contentView addSubview:self.lbPrice];
  [self.contentView addSubview:self.lbWeight];
  [self.contentView addSubview:self.lbName];
  [self.contentView addSubview:self.lbFid];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
