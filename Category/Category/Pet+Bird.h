//
//  Pet+Bird.h
//  Category
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import "Pet.h"

@interface Pet (Bird)

// Category中的方法会被扩展至主类
-(void)flyWith:(BOOL)wings;

@end
