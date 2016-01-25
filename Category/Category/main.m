//
//  main.m
//  Category
//
//  Created by Ruter on 16/1/25.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"
#import "Pet+Bird.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Pet *bird = [[Pet alloc] init];
    Pet *cat = [[Pet alloc] init];
    
    bird.name = @"Flappy";
    bird.age = 1;
    
    // Pet中实现的方法
    [bird aboutPet];
    [bird petYellWith:@"Chirp"];
    // Category中实现的方法，直接扩展到主类Pet中
    [bird flyWith:YES];
    
    cat.name = @"Neko";
    cat.age = 3;
    
    [cat aboutPet];
    [cat petYellWith:@"Meow"];
    [cat flyWith:NO];
    
    
    // Pet的子类Dog实例化对象
    Dog *d = [[Dog alloc] init];
    
    // 继承Pet的属性和方法
    d.name = @"Black";
    d.age = 3;
    
    [d aboutPet];
    [d petYellWith:@"Woow"];
    // 子类Dog中也会将扩展的方法继承下来
    [d flyWith:NO];
    
  }
    return 0;
}
