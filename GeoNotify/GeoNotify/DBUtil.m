//
//  DBUtil.m
//  GeoNotify
//
//  Created by Ruter on 16/3/18.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "DBUtil.h"

@implementation DBUtil

-(void)createDb {
  // Get document path
  NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *path = [docPaths objectAtIndex:0];
  // Get database path
  path = [path stringByAppendingPathComponent:@"Notify.db"];
  self.db = [FMDatabase databaseWithPath:path];
}

-(void)createTable {
  NSString *sql = @"create table Record (id integer primary key autoincrement not null, address text not null, latitude double not null, longitude double not null, describe text, createdtime TIMESTAMP default (datetime('now','localtime')) not null)";
  [self open];
  BOOL b = [self.db executeUpdate:sql];
  NSLog(@"%@", b?@"Create OK.":@"Create Fail.");
  [self close];
}

-(void)open {
  if (self.db != nil) {
    [self.db open];
  }
}

-(void)close {
  if (self.db != nil) {
    [self.db close];
  }
}

-(void)add:(NSString *)address andLatitude:(float)latitude andLongitude:(float)longitude andDescribe:(NSString *)describe {
//  NSString *sql = @"insert into Record (address, latitude, longitude, describe) values (?, ?, ?, ?)";
  NSString *sql = [NSString stringWithFormat:@"insert into Record (address, latitude, longitude, describe) values ('%@', %f, %f, '%@')", address, latitude, longitude, describe];
  [self open];
  BOOL b = [self.db executeUpdate:sql];
  NSLog(@"%@", b?@"Insert OK.":@"Insert Fail.");
  [self close];
}

-(void)del:(int)gid {
  NSString *sql = @"delete from Record where id = ?";
  [self open];
  BOOL b = [self.db executeUpdate:sql, [NSNumber numberWithInt:gid]];
  NSLog(@"%@", b?@"Delete OK.":@"Delete Fail.");
  [self close];
}

-(void)update {
  NSString *sql = @"update Record set col = ? where id = ?";
  [self open];
  NSString *col1, *col2;
  BOOL b = [self.db executeUpdate:sql, col1, col2];
  NSLog(@"%@", b?@"Update OK.":@"Update Fail.");
  [self close];
}

-(void)query {
  NSString *sql = @"select * from Record";
  [self open];
  FMResultSet *rs = [self.db executeQuery:sql];
  
  while ([rs next]) {
    int gid = [rs intForColumn:@"id"];
    NSString *address = [rs stringForColumn:@"address"];
    double latitude = [rs doubleForColumn:@"latitude"];
    double longitude = [rs doubleForColumn:@"longitude"];
    NSString *describe = [rs stringForColumn:@"describe"];
    NSString *createdTime = [rs stringForColumn:@"createdtime"];
    NSLog(@"gid = %d, address = %@, (%f, %f), describe = %@, createdTime = %@", gid, address, latitude, longitude, describe, createdTime);
  }
  
  [self close];
}


@end
