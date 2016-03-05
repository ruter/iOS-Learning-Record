//
//  DBUtil.m
//  SQLite
//
//  Created by Ruter on 16/3/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "DBUtil.h"

@implementation DBUtil

-(NSString *)getPath {
  // Get document path
  NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *path = [docPaths objectAtIndex:0];
  // Get database path
  path = [path stringByAppendingPathComponent:kDbName];
  return path;
}

-(sqlite3 *)open {
  // Declare database
  sqlite3 *database;
  // Get path
  NSString *path = self.getPath;
  NSLog(@"%@", path);
  // Open database
  NSInteger result = sqlite3_open([path UTF8String], &database);
  if (result == SQLITE_OK) {
    return database;
  }
  return nil;
}

-(void)close:(sqlite3 *)db {
  if (db != nil) {
    sqlite3_close(db);
  }
}

//-(BOOL)checkName:(NSString *)name dbName:(sqlite3 *)db {
//  char *err;
//  NSString *sql = [NSString stringWithFormat:@"select count(*) from sqlite_master where type = 'table' and name = '%@';", name];
//  const char *sql_stmt = [sql UTF8String];
//  
//  if (sqlite3_exec(db, sql_stmt, NULL, NULL, &err) == 1) {
//    return YES;
//  } else {
//    return NO;
//  }
//}

-(void)createTable:(sqlite3 *)db {
  // SQL
  char *sql = "create table Person(pid integer primary key autoincrement, name text, pwd text)";
  // Execute sql
  int result = sqlite3_exec(db, sql, 0, nil, nil);
  if (result == SQLITE_OK) {
    NSLog(@"Create OK");
  } else {
    NSLog(@"Create fail");
  }
}

-(void)insert:(Person *)person {
  // Open db
  sqlite3 *db = self.open;
  // SQL
  char *sql = "insert into Person(name, pwd)values(?, ?)";
  // Prepared statement
  sqlite3_stmt *stmt;
  if (sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK) {
    // Binding data
    sqlite3_bind_text(stmt, 1, [person.name UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 2, [person.pwd UTF8String], -1, nil);
  }
  // Execute sql
  if (sqlite3_step(stmt) == SQLITE_DONE) {
    NSLog(@"Insert OK.");
  } else {
    NSLog(@"Insert fail.");
  }
  // Release
  sqlite3_finalize(stmt);
  // Close
  [self close:db];
}

-(void)del:(int)pid {
  sqlite3 *db = self.open;
  // SQL
  char *sql = "delete from Person where pid = ?";
  // Prepared statement
  sqlite3_stmt *stmt;
  if (sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK) {
    // Binding data
    sqlite3_bind_int(stmt, 1, pid);
  }
  // Execute sql
  if (sqlite3_step(stmt) == SQLITE_DONE) {
    NSLog(@"Delete OK.");
  } else {
    NSLog(@"Delte fail.");
  }
  // Release
  sqlite3_finalize(stmt);
  // Close
  [self close:db];
}

-(void)update:(Person *)person {
  sqlite3 *db = self.open;
  char *sql = "update Person set name = ?, pwd = ? where pid = ?";
  sqlite3_stmt *stmt;
  if (sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK) {
    sqlite3_bind_text(stmt, 1, [[person name] UTF8String], -1, nil);
    sqlite3_bind_text(stmt, 2, [[person pwd] UTF8String], -1, nil);
    sqlite3_bind_int(stmt, 3, [person pid]);
  }
  if (sqlite3_step(stmt) == SQLITE_DONE) {
    NSLog(@"Update OK.");
  } else {
    NSLog(@"Update fail.");
  }
  sqlite3_finalize(stmt);
  [self close:db];
}

-(NSMutableArray *)query {
  sqlite3 *db = self.open;
  char *sql = "select pid, name, pwd from Person";
  sqlite3_stmt *stmt;
  // Create a mutable array
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
  if (sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK) {
    // Get data
    while (sqlite3_step(stmt) == SQLITE_ROW) {
      // First column
      int pid = sqlite3_column_int(stmt, 0);
      // Second column
      const char *name = (char*)sqlite3_column_text(stmt, 1);
      // Third column
      char *pwd = (char *)sqlite3_column_text(stmt, 2);
      // Instance Person
      Person *person = [[Person alloc] init];
      // Set values
      [person setPid:pid];
      [person setPwd:[NSString stringWithUTF8String:pwd]];
      [person setName:[NSString stringWithUTF8String:name]];
      // Add on array
      [array addObject:person];
    }
  }
  sqlite3_finalize(stmt);
  [self close:db];
  
  return array;
}

-(Person *)findPerson:(int)pid {
  sqlite3 *db = self.open;
  char *sql = "select name, pwd from Person where pid = ?";
  sqlite3_stmt *stmt;
  
  Person *person = [[Person alloc] init];
  
  if (sqlite3_prepare_v2(db, sql, -1, &stmt, nil) == SQLITE_OK) {
    sqlite3_bind_int(stmt, 1, pid);
  }
  
  if (sqlite3_step(stmt) == SQLITE_ROW) {
    const char *name = (char *)sqlite3_column_text(stmt, 0);
    char *pwd = (char *)sqlite3_column_text(stmt, 1);
    
    [person setPid:pid];
    [person setName:[NSString stringWithUTF8String:name]];
    [person setPwd:[NSString stringWithUTF8String:pwd]];
  }
  
  sqlite3_finalize(stmt);
  [self close:db];
  
  return person;
}

@end
