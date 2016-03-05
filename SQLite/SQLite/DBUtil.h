//
//  DBUtil.h
//  SQLite
//
//  Created by Ruter on 16/3/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Person.h"

// Define database's name
#define kDbName @"sqlite3.db"

@interface DBUtil : NSObject

// 1. Create Database
// 2. Create Table
// 3. Create Retrive Update Delete

// Get DB file's path
-(NSString *)getPath;

// Open database
-(sqlite3 *)open;

// Close database
-(void)close:(sqlite3 *)db;

// Create Table
-(void)createTable:(sqlite3 *)db;

// Insert
-(void)insert:(Person *)person;

// Delete
-(void)del:(int)pid;

// Update
-(void)update:(Person *)person;

// Query
-(NSMutableArray *)query;

// Query by pid
-(Person *)findPerson:(int)pid;

@end
