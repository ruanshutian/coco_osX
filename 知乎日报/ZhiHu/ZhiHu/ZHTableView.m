//
//  ZHTableView.m
//  ZhiHu
//
//  Created by Aron Ruan on 2022/5/27.
//

#import "ZHTableView.h"

@implementation ZHCustomRowView

- (instancetype)initWithFrame:(NSRect)frameRect {
    self =[super initWithFrame:frameRect];
    if (self) {
        
//        NSImage*image = [NSImage imageNamed:@"updata"];
        self.imageView = [[NSImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
//        [self.imageView setImage:image];
        [self addSubview:self.imageView];
        
        self.textView = [[NSTextView alloc] initWithFrame:CGRectMake(90, 0, frameRect.size.width - 120, 80)];
        self.textView.editable=NO;
        self.textView.selectable=NO;
        [self addSubview:self.textView];
    }
    return self;
}

@end

@implementation ZHTableView

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

@end
