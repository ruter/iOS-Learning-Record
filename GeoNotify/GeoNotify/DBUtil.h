//
//  DBUtil.h
//  GeoNotify
//
//  Created by Ruter on 16/3/18.
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
-(void)add:(NSString *)address andLatitude:(float)latitude andLongitude:(float)longitude andDescribe:(NSString *)describe;
-(void)del:(int)gid;
-(void)update;
-(void)query;

@end
