//
//  FruitTableViewCell.h
//  UITableViewCell
//
//  Created by Ruter on 16/2/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FruitTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *lbFid;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbWeight;
@property (nonatomic, strong) UILabel *lbPrice;

-(void)prepareLayout;
@end
