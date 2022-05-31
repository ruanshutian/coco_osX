//
//  MainSplitView.m
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/29.
//

#import "MainSplitView.h"

@implementation MainSplitView
NSInteger dataChangeNumber = 20220527;
- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if(self)
    {
        
        
        _stories = [[NSMutableArray alloc] init];
        
        self.autoresizingMask =YES;
        [self setVertical:YES];
        [self setDividerStyle:NSSplitViewDividerStyleThin];
        
        CGRect selfRect = NSMakeRect(self.frame.origin.x, self.frame.origin.y, self.frame.size.width/2, self.frame.size.height );
        
        _leftView = [[LeftView alloc] initWithFrame:selfRect];
        _leftView.autoresizingMask = YES;
        [_leftView setAutoresizesSubviews:YES];
        _rightView = [[RightView alloc]initWithFrame:selfRect];
        _rightView.autoresizingMask =YES;
        [_rightView setAutoresizesSubviews:YES];
        
        [self addSubview:_leftView];
        [self addSubview:_rightView];
        
        _webView = [[WKWebView alloc] initWithFrame:_rightView.frame];
        //
        NSArray* constrains = _leftView.constraints;
        for (NSLayoutConstraint* constraint in constrains) {
            if (constraint.firstAttribute == NSLayoutAttributeHeight) {
                constraint.constant = 0;
            }
        }
        constrains = _rightView.constraints;
        for (NSLayoutConstraint* constraint in constrains) {
            if (constraint.firstAttribute == NSLayoutAttributeHeight) {
                constraint.constant = 0;
            }
        }
        
        
        [_rightView addSubview:_webView];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news-at.zhihu.com"]]];
        
        
        NSScrollView * scrollView    = [[NSScrollView alloc] init];
        scrollView.hasVerticalScroller  = YES;
        scrollView.frame = self.leftView.frame;
        [self.leftView addSubview:scrollView];
        
        _tableView = [[ZHTableView alloc]initWithFrame:self.leftView.frame];
        _tableView.rowHeight = 100;
        
        NSTableColumn * column = [[NSTableColumn alloc]initWithIdentifier:@"test"];
        column.title = @"知乎日报";
        column.width = _leftView.frame.size.width - _tableView.imageView.frame.size.width - 20;
        [_tableView addTableColumn:column];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        scrollView.contentView.documentView = _tableView;
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config];
        
        NSString *urlString = @"http://news-at.zhihu.com/api/3/stories/latest";
        NSURL *url =[[NSURL alloc] initWithString:urlString];
        [self getData:url :self.stories];
        
        [_tableView reloadData];
        
        [_tableView setAction:NSSelectorFromString(@"tableViewClick:")];
        
        
        //
        _webView.translatesAutoresizingMaskIntoConstraints = NO;

        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeLeft relatedBy:0 toItem:_webView.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_webView.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_webView.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_webView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_webView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        NSArray<NSLayoutConstraint *>*ConstraintsArray = @[left,right,top,bottom];
        [_webView.superview addConstraints:ConstraintsArray];
        
        //
        scrollView.translatesAutoresizingMaskIntoConstraints = NO;

        NSLayoutConstraint *left2 = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeLeft relatedBy:0 toItem:scrollView.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        NSLayoutConstraint *top2 = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:scrollView.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        NSLayoutConstraint *right2 = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:scrollView.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint *bottom2 = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:scrollView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        
        NSLayoutConstraint *textStyle = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:scrollView.superview attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
//        NSLayoutConstraint *textStyle = [NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:scrollView.superview attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
        
        NSArray<NSLayoutConstraint *>*ConstraintsArray2 = @[left2,right2,top2,bottom2,textStyle];
        [scrollView.superview addConstraints:ConstraintsArray2];
        
        //
//        _tableView.translatesAutoresizingMaskIntoConstraints = NO;

//        NSLayoutConstraint *left3 = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeLeft relatedBy:0 toItem:_tableView.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
//        NSLayoutConstraint *top3 = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_tableView.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//        NSLayoutConstraint *right3 = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_tableView.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
//        NSLayoutConstraint *bottom3 = [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_tableView.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
//        NSArray<NSLayoutConstraint *>*ConstraintsArray3 = @[left3,right3,top3,bottom3];
//        [_tableView.superview addConstraints:ConstraintsArray3];
//
        
        
    }
    return self;
}
- (void)tableViewClick: (id)sender
{
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

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSLog(@"drawRect");
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor yellowColor].CGColor;
    
    self.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:0 toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];

    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
//    self.top = super.top * 2 + const
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];

        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];

    NSArray<NSLayoutConstraint *>*ConstraintsArray = @[left,right,top,bottom];
    [self.superview addConstraints:ConstraintsArray];
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _stories.count + 1 ;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return _stories[row];
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
//            [_zhTableView reloadData];
        });
        
        }];
    [task resume];
    

}

-(void)showZhiHu:(NSMutableArray <Stories *> *)Story
{
    [_tableView reloadData];
}
- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    ZHCustomRowView *rowView = [[ZHCustomRowView alloc] initWithFrame:NSMakeRect(0, 0, tableView.frame.size.width, 80)];
    if(row<_stories.count)
    {
        Stories *story = [self.stories objectAtIndex:row];
        NSLog(@"story = %@",story);
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
