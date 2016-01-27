//
//  ViewController.h
//  KVO
//
//  Created by Ruter on 16/1/27.
//  Copyright © 2016年 Ruter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *array;

@property (weak, nonatomic) IBOutlet UILabel *lbDisplay;

- (IBAction)btnChange:(id)sender;

- (IBAction)btnChangeArr:(id)sender;

#pragma mark - Array KVC methods
-(NSUInteger)countOfArray;

-(id)objectInArrayAtIndex:(NSUInteger)index;

-(void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index;

-(void)removeObjectFromArrayAtIndex:(NSUInteger)index;

-(void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object;

@end

