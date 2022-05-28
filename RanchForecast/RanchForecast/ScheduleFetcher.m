//
//  ScheduleFetcher.m
//  RanchForecast
//
//  Created by Aron Ruan on 2022/5/20.
//

#import "ScheduleFetcher.h"

@implementation FetchCoursesResult

- (instancetype)init
{
    self= [super init];
    if(self)
    {
//        _Failure = [NSError init];
        _Success = [[NSMutableArray alloc] init];
    }
    return self;
}

@end

@implementation ScheduleFetcher

//enum FetchCoursesResult {
////        case Success([Course])
////        case Failure(NSError)
//};


- (instancetype)init
{
    self= [super init];
    
    if(self)
    {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config];
        _result = [[FetchCoursesResult alloc] init];
    }
    
    return  self;;
}

-(void)fetchCoursesUsingCompletionHandler:(FetchCoursesResult*)completionHandler
{
    NSLog(@"fetchCoursesUsingCompletionHandler");
    NSURL *url =[[NSURL alloc] initWithString:@"http://news-at.zhihu.com/api/3/stories/latest/"];
//    NSLog(@"self.session = %@",self.session);
//    NSURLSessionDataTask *task1 = [self.session dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
////    task1.state;
//    [task1 resume];
//    NSLog(@"task1 = %@",task1);
//    NSLog(@"task1.response = %@",task1.response);
//    NSURLSessionDataTask *res1 = [[]]
    
//    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *responses = (NSHTTPURLResponse *)response;
        if(data == NULL)
        {
            NSLog(@"NULL");
            self.result.Failure = error;
        }
//        else{
//            NSLog(@"data = %@",data);
//            self.result.Success = [[NSMutableArray alloc] init];
//        }
        NSLog(@"data = %@",data);
        if(responses.statusCode ==200)
        {
            NSLog(@"200");
            self.result.Success = [[NSMutableArray alloc] init];
        }
        else
        {
            NSError *errorTemp = [NSError errorWithDomain:[NSString stringWithFormat:@"Bad status code  %ld",responses.statusCode] code:1 userInfo:nil];
            NSLog(@"errorTemp.localizedDescription = %@",errorTemp.localizedDescription);
            self.result.Failure = errorTemp;
        }
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            FetchCoursesResult* completionHandler = [[FetchCoursesResult alloc] init];
            completionHandler = self.result;
        }];
        
    }];
    
    [task resume];
}

@end
