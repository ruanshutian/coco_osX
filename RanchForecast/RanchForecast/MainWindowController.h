//
//  MainWindowController.h
//  RanchForecast
//
//  Created by Aron Ruan on 2022/5/20.
//

#import <Cocoa/Cocoa.h>
#import "ScheduleFetcher.h"
#import "Course.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainWindowController : NSWindowController

@property(nonatomic)ScheduleFetcher *fetcher;
@property(nonatomic)NSMutableArray<Course*>*courses;
@property(nonatomic)FetchCoursesResult*result;

@end

NS_ASSUME_NONNULL_END
