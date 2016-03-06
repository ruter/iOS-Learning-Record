//
//  CDUtil.h
//  CoreData
//
//  Created by Ruter on 16/3/6.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CDUtil : NSObject

@property (nonatomic, strong) NSManagedObjectContext *context;

-(void)addCustomer;
-(void)query;

@end
