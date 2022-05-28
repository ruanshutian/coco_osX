//
//  NSNumber+NSNumber_LengthCompare.m
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/7.
//

#import "NSNumber+NSNumber_LengthCompare.h"

@implementation NSNumber (NSNumber_LengthCompare)

-(NSComparisonResult)compare1:(NSNumber *)other
{
//    if ([self length] > [other length]) {
//        return NSOrderedDescending;
//    }
//
//    if ([self length] < [other length]) {
//        return NSOrderedAscending;
//    }
    
    return NSOrderedAscending;
}

@end
