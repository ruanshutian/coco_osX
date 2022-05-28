//
//  ScheduleFetcher.h
//  RanchForecast
//
//  Created by Aron Ruan on 2022/5/20.
//

#import <Foundation/Foundation.h>

#import "Course.h"
NS_ASSUME_NONNULL_BEGIN
@interface FetchCoursesResult : NSObject
@property(nonatomic)NSMutableArray<Course*>*Success;
@property(nonatomic)NSError*Failure;
@end

@interface ScheduleFetcher : NSObject
@property(nonatomic)NSURLSession *session;
@property(nonatomic)FetchCoursesResult*result;

-(void)fetchCoursesUsingCompletionHandler:(FetchCoursesResult*)completionHandler;

@end

NS_ASSUME_NONNULL_END
