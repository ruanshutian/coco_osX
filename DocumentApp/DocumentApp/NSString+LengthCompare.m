//
//  NSString+LengthCompare.m
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/7.
//

#import "NSString+LengthCompare.h"

@implementation NSString (LengthCompare)

-(NSComparisonResult)compareWithOthers:(NSString *)other {
    if ([self length] > [other length]) {
        return NSOrderedDescending;
    }
    
    if ([self length] < [other length]) {
        return NSOrderedAscending;
    }
    
    return [self caseInsensitiveCompare:other];
}

@end
