//
//  NSString+LengthCompare.h
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LengthCompare)

-(NSComparisonResult)compareWithOthers:(NSString *)other;

@end

NS_ASSUME_NONNULL_END
