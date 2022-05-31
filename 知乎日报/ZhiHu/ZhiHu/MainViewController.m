//
//  MainViewController.m
//  ZhiHu
//
//  Created by Aron Ruan on 2022/5/26.
//

#import "MainViewController.h"
#import <WebKit/WebKit.h>
#import "Stories.h"
#import "EntireStories.h"
#import "YYModel/YYModel.h"
#import "ZHTableView.h"

@interface MainViewController ()<NSTableViewDataSource, NSTableViewDelegate>
@property(weak)IBOutlet WKWebView*webView;

@property(weak)IBOutlet NSTableHeaderView*tableHeaderView;

@property(nonatomic)NSURLSession *session;
@property(nonatomic,strong) NSMutableArray <Stories *> *stories;

@property(nonatomic) NSMutableArray  *dataArray;
@property (weak) IBOutlet ZHTableView *tableView;

@property (weak) IBOutlet NSSplitView *spliteView;
@property(nonatomic)BOOL isFeatchNextPage;

@end

@implementation MainViewController

//开始日期

NSInteger dataChangeNumber = 20220527;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取当前日期
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    NSString *dateString = [formatter stringFromDate:date];
    NSInteger dateNumber = [dateString intValue];
    dataChangeNumber = dateNumber;
    
    _isFeatchNextPage = NO;

    // Do view setup here.
    NSLog(@"viewDidLoad");
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news-at.zhihu.com"]]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config];
    
    self.stories = [[NSMutableArray alloc] init];
    NSString *urlString = @"http://news-at.zhihu.com/api/3/stories/latest";
    NSURL *url =[[NSURL alloc] initWithString:urlString];
    [self getData:url :self.stories];
    
//    self.tableHeaderView.
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

-(void)getData:(NSURL*)url: (NSMutableArray <Stories *> *)Story
{
    NSLog(@"getData");
    __block NSDictionary*jsonDictTemp = [[NSDictionary alloc]init];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        EntireStories *storyJson = [EntireStories yy_modelWithDictionary:dataDictionary];
        jsonDictTemp =[storyJson yy_modelToJSONObject];
//        NSLog(@"jsonDictTemp = %@",jsonDictTemp);
        for(NSDictionary*storyStory in jsonDictTemp[@"stories"])
        {
            Stories*storyTemp = [[Stories alloc] init];
            storyTemp.title=storyStory[@"title"];
//            [Story addObject:storyTemp];
            storyTemp.url=storyStory[@"url"];
//            [Story addObject:storyTemp];
            storyTemp.images = storyStory[@"images"];
            [Story addObject:storyTemp];
        }
        //
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showZhiHu:Story];
        });
        
        }];
    [task resume];
    

}

-(void)getNextPageData:(NSURL*)url: (NSMutableArray <Stories *> *)Story
{
    NSLog(@"getData");
    __block NSDictionary*jsonDictTemp = [[NSDictionary alloc]init];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        EntireStories *storyJson = [EntireStories yy_modelWithDictionary:dataDictionary];
        jsonDictTemp =[storyJson yy_modelToJSONObject];
//        NSLog(@"jsonDictTemp = %@",jsonDictTemp);
        for(NSDictionary*storyStory in jsonDictTemp[@"stories"])
        {
            Stories*storyTemp = [[Stories alloc] init];
            storyTemp.title=storyStory[@"title"];
//            [Story addObject:storyTemp];
            storyTemp.url=storyStory[@"url"];
//            [Story addObject:storyTemp];
            storyTemp.images = storyStory[@"images"];
            [Story addObject:storyTemp];
        }
        self.isFeatchNextPage = NO;
        [self performSelector:@selector(showZhiHu:) onThread:[NSThread mainThread] withObject:Story waitUntilDone:YES];
        
        
        }];
    [task resume];
    

}

-(void)showZhiHu:(NSMutableArray <Stories *> *)Story
{
    [_tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _stories.count + 1;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    NSLog(@"_stories.count =%ld  row =%ld ",_stories.count,row);
    
    if (row == _stories.count) {
        Stories *  storyTemp = [[Stories alloc] init];
        storyTemp.title = @"updata";
        return storyTemp;
    }
    
    return _stories[row];
}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    
//    if (row >= _stories.count) {
//        ZHCustomRowView *rowView = [[ZHCustomRowView alloc] initWithFrame:NSMakeRect(0, 0, tableView.frame.size.width, 80)];
//        return rowView;
//    }
    ZHCustomRowView *rowView = [[ZHCustomRowView alloc] initWithFrame:NSMakeRect(0, 0, tableView.frame.size.width, 80)];
    if(row<_stories.count)
    {
        Stories *story = [_stories objectAtIndex:row];
        NSString*title = story.title;
        rowView.textView.string = title;
        NSString *imageUrl = [story.images firstObject];
        NSString *str =imageUrl;
        NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:str]];
        NSImage* image = [[NSImage alloc] initWithData:imageData];
        [rowView.imageView setImage:image];
    }
    else{
        rowView.textView.string = @"updata";
        NSImage*image = [NSImage imageNamed:@"updata"];
        [rowView.imageView setImage:image];
    }
    return rowView;
}




- (IBAction)tableAction:(id)sender {
    NSLog(@"tableAction");
    NSInteger row =[_tableView clickedRow];
    if(row<self.stories.count)
    {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.stories[row].url]]];
    }
    else{
        
        dataChangeNumber = [self dataChange:dataChangeNumber];
        NSString*dataChangeStr = [NSString stringWithFormat:@"%ld",dataChangeNumber];
        NSString *nextPageStr = @"http://news.at.zhihu.com/api/3/news/before/";
        nextPageStr = [nextPageStr stringByAppendingString:dataChangeStr];
//        NSString *nextPageStr = @"http://news-at.zhihu.com/api/3/stories/latest";
        NSLog(@"nextPageStr = %@",nextPageStr);
        NSURL*nextPageUrl = [NSURL URLWithString:nextPageStr];
        [self getData:nextPageUrl :self.stories];
//        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news-at.zhihu.com"]]];
    }

}

-(NSInteger)dataChange:(NSInteger)nowDateNumber
{
    NSInteger nextDateNunmber = nowDateNumber;
    NSInteger year = nowDateNumber/10000;
    NSInteger month = (nowDateNumber - year*10000)/100;
    NSInteger day = nowDateNumber %100;
    NSLog(@"year = %ld",year);
    NSLog(@"month = %ld",month);
    NSLog(@"day = %ld",day);
    //日期--
    if(day > 1)
    {
        day--;
    }
    else if(day ==1 && month >1)
    {
        month--;
        //day
        if([self isRunYears:year] && month == 2)
        {
            day = 29;
        }
        else if (![self isRunYears:year] && month == 2)
        {
            day =28;
        }
        else if([@[@1,@3,@5,@7,@8,@10,@12] containsObject:[NSString stringWithFormat:@"%ld",month]] )
        {
            day = 31;
        }
        else
        {
            day = 30;
        }
    }
    else if(month ==1)
    {
        month =12;
        year--;
    }
    //日期++
//    if(month == 2)
//    {
//        if([self isRunYears:year])
//        {
//            if(day<29)
//            {
//                day++;
//            }
//            else{
//                month++;
//                day = 1;
//            }
//        }
//        else{
//            if(day<28)
//            {
//                day++;
//            }
//            else{
//                month++;
//                day = 1;
//            }
//        }
//    }
//    else if (month == 1 || month == 3 || month == 5 || month ==7 || month ==8 || month ==10 || month ==12)
//    {
//        if(month == 12 && day ==31)
//        {
//            month = 1;
//            day = 1;
//            year++;
//        }
//        else{
//            if(day<31)
//            {
//                day++;
//            }
//            else{
//                month++;
//                day = 1;
//            }
//        }
//
//    }
//    else
//    {
//        if(day<30)
//        {
//            day++;
//        }
//        else{
//            month++;
//            day = 1;
//        }
//    }
    
    nextDateNunmber = year*10000 + month*100 + day;
    return nextDateNunmber;
}

-(BOOL)isRunYears:(NSInteger)year
{
    if(year/4 == 0)
    {
        return YES;
    }
    return NO;
}


@end
