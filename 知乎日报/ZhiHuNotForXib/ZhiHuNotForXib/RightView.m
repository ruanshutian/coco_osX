//
//  RightView.m
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/30.
//

#import "RightView.h"

@implementation RightView
- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if(self)
    {
//        CGRect tableViewFrame = CGRectMake(0, 0, 50, 50);
//        NSTableView*tableView = [[NSTableView alloc] initWithFrame:tableViewFrame];
//        tableView.backgroundColor = [NSColor blueColor];
//        [self addSubview:tableView];
//        _webView = [[WKWebView alloc] initWithFrame:self.frame];
//        [self addSubview:_webView];
        

//        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news-at.zhihu.com"]]];
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
//        self.wantsLayer = YES;
//        self.layer.backgroundColor = [NSColor blueColor].CGColor;
    
}

@end
