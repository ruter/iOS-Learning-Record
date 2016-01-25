//
//  Pet.h
//  Category
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;

-(void)aboutPet;

-(void)petYellWith:(NSString *)yell;

@end
