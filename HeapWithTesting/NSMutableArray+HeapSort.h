//
//  NSMutableArray+HeapSort.h
//  HeapWithTesting
//
//  Created by Morgan Chen on 12/27/14.
//  Copyright (c) 2014 Morgan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (HeapSort)

+ (instancetype)randomArrayWithLength:(NSUInteger)length;
- (void)sortWithHeapSort;
- (void)heapify;

@end
