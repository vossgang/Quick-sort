//
//  mvViewController.m
//  QuickSort
//
//  Created by Matthew Voss on 5/20/14.
//  Copyright (c) 2014 matt. All rights reserved.
//

#import "mvViewController.h"

@interface mvViewController ()

@end

@implementation mvViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *numbers = [NSMutableArray new];
    
    for (int i = 0; i < 1000000; i++) {
        [numbers addObject:[NSNumber numberWithInt:arc4random()]];
    }

    NSDate *now = [NSDate date];
    [self quickSortArray:numbers withStatingPoint:0 AndEndingPoint:(numbers.count - 1)];
    NSLog(@"%f", [[NSDate date] timeIntervalSinceDate:now]);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






-(void)quickSortArray:(NSMutableArray *)array withStatingPoint:(NSInteger)start AndEndingPoint:(NSInteger)end
{
    int pivot;
    if (start < end) {
        pivot = [self quickSortPartOfArray:array WithStartingPoint:start AndEndingPoint:end];
        [self quickSortArray:array withStatingPoint:start AndEndingPoint:pivot -1];
        [self quickSortArray:array withStatingPoint:pivot + 1 AndEndingPoint:end];
    }
}


-(NSInteger)quickSortPartOfArray:(NSMutableArray *)array WithStartingPoint:(NSInteger)startingIndex AndEndingPoint:(NSInteger)endingIndex
{
    int pivot           = [array[startingIndex] intValue];
    int currentIndex    = startingIndex;
    
    for (int i = startingIndex; i <= endingIndex; i++) {
        if ([array[i] intValue] < pivot) {
            currentIndex++;
            [array exchangeObjectAtIndex:i withObjectAtIndex:currentIndex];
        }
    }
    [array exchangeObjectAtIndex:startingIndex withObjectAtIndex:currentIndex];
    
    
    return currentIndex;
}

@end

