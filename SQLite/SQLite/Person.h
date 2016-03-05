//
//  Person.h
//  SQLite
//
//  Created by Ruter on 16/3/3.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, assign) int pid;
@property(nonatomic, copy) NSString *name, *pwd;

@end
