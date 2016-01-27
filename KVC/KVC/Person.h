//
//  Person.h
//  KVC
//
//  Created by Ruter on 16/1/27.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;

@property (nonatomic, strong) Person *person;

@end
