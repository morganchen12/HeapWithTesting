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
    // generate an array with random contents (NSNumbers)
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [array addObject:@(arc4random() % (length+1))];
    }
    return array;
}

- (void)swapIndex:(NSUInteger)index1 withIndex:(NSUInteger)index2 {
    // simple swap function
    id objectAtIndex1 = self[index1];
    self[index1] = self[index2];
    self[index2] = objectAtIndex1;
}

// Implement these functions

- (void)sortWithHeapSort {
    
    // use heapEnd to separate heap part of array and sorted part of array
    // sort by pulling root of max heap and swapping it to the back of array,
    // then reheapify after swap
    int heapEnd = (int)self.count-1;
    
    // degenerate case
    if (self.count <= 1) return;
    
    // initially heapify entire array
    [self heapify];
    
    while (heapEnd > 0) {
        
        // place root of max heap at end of array and decrement heapEnd
        [self swapIndex:0 withIndex:heapEnd];
        heapEnd--;
        
        NSUInteger nodeIndex = 0;
        NSUInteger leftChildIndex = 2*nodeIndex + 1;
        NSUInteger rightChildIndex = 2*nodeIndex + 2;
        
        // reheapify iteratively
        while (nodeIndex <= heapEnd) {
            
            // child exists if indexes aren't out of bounds
            BOOL leftChildExists = (leftChildIndex <= heapEnd);
            BOOL rightChildExists = (rightChildIndex <= heapEnd);
            
            NSNumber *node = self[nodeIndex];
            NSNumber *leftChild;
            NSNumber *rightChild;
            
            // one-line if statements assign pointers only if indexes are valid
            if (leftChildExists) leftChild = self[leftChildIndex];
            if (rightChildExists) rightChild = self[rightChildIndex];
            
            NSNumber *largestChild;
            NSUInteger largestChildIndex;
            
            // if no children, exit loop
            if (!leftChildExists && !rightChildExists) {
                break;
            }
            
            // determine largest child
            // consider 2 cases: one child exists or both exist
            // if only one child exists, it must be the left child
            // here, we handle the single child case
            if (!leftChildExists) {
                largestChild = rightChild;
                largestChildIndex = rightChildIndex;
            }
            else if (!rightChildExists) {
                largestChild = leftChild;
                largestChildIndex = leftChildIndex;
            }
            
            // handle both children case, compare both and pick largest
            else {
                if ([leftChild compare:rightChild] == NSOrderedAscending) {
                    largestChild = rightChild;
                    largestChildIndex = rightChildIndex;
                }
                else {
                    largestChild = leftChild;
                    largestChildIndex = leftChildIndex;
                }
            }
            
            // compare node with largest child and swap if child is bigger in order to maintain max heap
            if ([node compare:largestChild] != NSOrderedDescending) {
                [self swapIndex:nodeIndex withIndex:largestChildIndex];
                
                // reassign pointers
                nodeIndex = largestChildIndex;
                leftChildIndex = 2*nodeIndex + 1;
                rightChildIndex = 2*nodeIndex + 2;
            }
            else {
                // if no swaps are possible, then our heap is in order and we can exit loop
                break;
            }
        }
    }
}

- (void)heapify {
    // produce max heap
    
    for (int i = 0; i < self.count; i++) {
        
        int nodeIndex = i;
        int parentIndex = (int)((i-1)/2);
        
        NSNumber *parent = self[parentIndex];
        NSNumber *node = self[nodeIndex];
        
        // check parent as long as node is not root
        while (nodeIndex != parentIndex) {
            
            // if parent is greater than child, swap
            if ([node compare:parent] != NSOrderedAscending) {
                [self swapIndex:parentIndex withIndex:nodeIndex];
            }
            else {
                break;
            }
            
            // reassign pointers
            nodeIndex = parentIndex;
            parentIndex = (int)((nodeIndex-1)/2);
            
            parent = self[parentIndex];
            node = self[nodeIndex];
        }
    }
}

@end
