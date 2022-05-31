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
        NSLog(@"selfselfself");
        
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
//    self.wantsLayer = YES;
//    self.layer.backgroundColor = [NSColor blueColor].CGColor;
    
//    self.translatesAutoresizingMaskIntoConstraints = NO;
//
//    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:0 toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
//
//    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:50];
////    self.top = super.top * 2 + const
//        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
//
//        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
//
//    NSArray<NSLayoutConstraint *>*ConstraintsArray = @[left,right,top,bottom];
//    [self.superview addConstraints:ConstraintsArray];
    
}

@end
