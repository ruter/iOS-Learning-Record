//
//  DBUtil.h
//  FMDB
//
//  Created by Ruter on 16/3/5.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DBUtil : NSObject

@property(nonatomic, strong) FMDatabase *db;

-(void)createDb;
-(void)createTable;
-(void)open;
-(void)close;
-(void)add;
-(void)del;
-(void)update;
-(void)query;

@end
