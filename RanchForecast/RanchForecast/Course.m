//
//  Course.m
//  RanchForecast
//
//  Created by Aron Ruan on 2022/5/20.
//

#import "Course.h"

@implementation Course

- (instancetype)init:(NSString*)title :(NSURL*)url :(NSDate*)nextStartDate
{
    self = [super init];
    if(self)
    {
        _title = title;
        _url = url;
        _nextStartDate =nextStartDate;
    }
    return self;
}




@end
