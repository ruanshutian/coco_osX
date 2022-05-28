//
//  MainWindowController.m
//  RanchForecast
//
//  Created by Aron Ruan on 2022/5/20.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _courses = [[NSMutableArray alloc] init];
        _fetcher = [[ScheduleFetcher alloc] init];
        _result = [[FetchCoursesResult alloc] init];
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSLog(@" windowDidLoad ");
    NSLog(@"self.result =%@",self.result);
    [self.fetcher fetchCoursesUsingCompletionHandler:self.result];
    NSLog(@"self.result =%@",self.result);
//    if(self.result)
}

- (NSNibName)windowNibName
{
    return @"MainWindowController";
}

@end
