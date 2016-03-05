//  DBUtil.m
//
//  FMDB
//
//  Created by Ruter on 16/3/5.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "DBUtil.h"

@implementation DBUtil

-(void)createDb {
  // Get document path
  NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *path = [docPaths objectAtIndex:0];
  // Get database path
  path = [path stringByAppendingPathComponent:@"FMDB.db"];
  self.db = [FMDatabase databaseWithPath:path];
}

-(void)createTable {
  NSString *sql = @"create table User(uid integer primary key autoincrement, name text)";
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

-(void)add {
  NSString *sql = @"insert into User(name) values('Tyler')";
  [self open];
  BOOL b = [self.db executeUpdate:sql];
  NSLog(@"%@", b?@"Insert OK.":@"Insert Fail.");
  [self close];
}

-(void)query {
  NSString *sql = @"select * from User";
  [self open];
  FMResultSet *rs = [self.db executeQuery:sql];
  
  while ([rs next]) {
    int uid = [rs intForColumn:@"uid"];
    NSString *name = [rs stringForColumn:@"name"];
    NSLog(@"uid = %d, name = %@", uid, name);
  }
  
  [self close];
}

@end
