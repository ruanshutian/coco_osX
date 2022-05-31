//
//  LeftView.m
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/30.
//

#import "LeftView.h"


@implementation LeftView
- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if(self)
    {
//        _webView = [[WKWebView alloc] initWithFrame:self.frame];
//        [self addSubview:_webView];
        
//        NSScrollView*scrollView = [[NSScrollView alloc]initWithFrame:self.frame];
////        scrollView.backgroundColor = [NSColor blueColor];
//        [self addSubview:scrollView];
//        NSClipView*clipView = [[NSClipView alloc]initWithFrame:self.frame];
////        clipView.backgroundColor =[NSColor blueColor];
//        [scrollView addSubview:clipView];
//        
//        ZHTableView*zhTableView = [[ZHTableView alloc]initWithFrame:self.frame];
//        [clipView addSubview:zhTableView];
        
        
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
//        self.wantsLayer = YES;
//        self.layer.backgroundColor = [NSColor blackColor].CGColor;
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _stories.count ;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return _stories[row];
}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    
    ZHCustomRowView *rowView = [[ZHCustomRowView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
    rowView.textView.string = @"111";
    NSImage*image = [NSImage imageNamed:@"updata"];
    rowView.imageView = [[NSImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [rowView.imageView setImage:image];
    return rowView;
}

@end
