//
//  NSMutableArray+HeapSort.m
//  HeapWithTesting
//
//  Created by Morgan Chen on 12/27/14.
//  Copyright (c) 2014 Morgan Chen. All rights reserved.
//

#import "NSMutableArray+HeapSort.h"

@implementation NSMutableArray (HeapSort)

+ (instancetype)randomArrayWithLength:(NSUInteger)length {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:@(arc4random())];
    }
    return array;
}

// Implement these functions

- (void)sortWithHeapSort {
    
}

- (void)heapify {
    
}

-(void)reheapify {
    
}

@end
