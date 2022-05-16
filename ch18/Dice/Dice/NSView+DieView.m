//
//  NSView+DieView.m
//  Dice
//
//  Created by Aron Ruan on 2022/5/12.
//

#import "NSView+DieView.h"

@implementation NSView (DieView)

//- (instancetype)init
//{
//    NSLog(@"NSView init()");
//    return self;
//}
//
//- (void)drawRect:(NSRect)dirtyRect
//{
//    NSLog(@"hhhh");
//    NSColor* backgroundColor = [[NSColor alloc] init];
//    backgroundColor = [NSColor lightGrayColor];
//    [backgroundColor set];
//
//    [NSBezierPath fillRect:self.bounds];
//
//}

@end

@implementation DieView



//- (NSInteger)intValue
//{
//    self.needsDisplay = YES;
//    self.intValue = _intValue;
//    return _intValue;
//}

- (instancetype)init{
//    NSLog(@"init");
    self = [super init];
    if(self)
    {
        _intValue=1;
        _pressed =NO;
        self.needsDisplay =1;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
//    NSLog(@"drawRect");
    NSColor* backgroundColor = [[NSColor alloc] init];
    backgroundColor = [NSColor lightGrayColor];
    [backgroundColor set];
    
    [NSBezierPath fillRect:self.bounds];
    
//    [[NSColor greenColor] set];
//    NSBezierPath*path = [[NSBezierPath alloc]init];
//    [path moveToPoint:CGPointMake(0.0, 0.0)];
//    [path lineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
//    [path stroke];
    
    [self drawDieWithSize:self.bounds.size];
    
}

-(void)metricsForSize:(CGSize)size:(CGFloat*)edgeLength:(CGRect*)dieFrame
{
    NSLog(@"metricsForSize ");
    *edgeLength = MIN(size.width, size.height);
    CGFloat padding = *edgeLength/10.0;
    NSLog(@"padding = %f",padding);
    CGRect drawingBounds = CGRectMake(0, 0, *edgeLength, *edgeLength);
    *dieFrame = CGRectInset(drawingBounds, padding, padding);
//    NSLog(@"dieFrame = %f",CGRectInset(drawingBounds, padding, padding).size.width);
    if(_pressed )
    {
        *dieFrame = CGRectInset(*dieFrame, 0, -*edgeLength/40);
    }
    
}

-(void)drawDieWithSize:(CGSize)size
{
//    NSLog(@"self.intValue = %ld",self.intValue);
//    NSInteger intValue =self.intValue;
    BOOL f=(BOOL)self.intValue;
    f = YES;
    NSLog(@"f = %d",f);
    if(f)
    {
        CGFloat edgeLength ;
        CGRect dieFrame;
        [self metricsForSize:size :&edgeLength :&dieFrame];
        CGFloat cornerRadius =edgeLength/5.0;
        
        CGFloat dotRadius = edgeLength/12.0;
        CGRect dotFrame =CGRectInset(dieFrame, dotRadius*2.5, dotRadius*2.5);
        
        //
        [NSGraphicsContext saveGraphicsState];
        
        //
        NSShadow*shadow = [[NSShadow alloc]init];
        shadow.shadowOffset = CGSizeMake(0,-1);
        
        if(_pressed)
        {
            shadow.shadowBlurRadius = edgeLength/100;
        }
        else{
            shadow.shadowBlurRadius = edgeLength/20;
        }
        
        [shadow set];
        
        //
        [[NSColor whiteColor] set];
    //    NSBezierPath*path=[NSBezierPath bezierPathWithRoundedRect:dieFrame xRadius:cornerRadius yRadius:cornerRadius];
        NSBezierPath*path = [[NSBezierPath alloc]init];
        [path appendBezierPathWithRoundedRect:dieFrame xRadius:cornerRadius yRadius:cornerRadius];
        [path fill];
        
        [NSGraphicsContext restoreGraphicsState];
        
        //
        [[NSColor blackColor] set];
//        dotFrame
//        -(void)drawDot:(CGFloat)u:(CGFloat)v
//        {
//
//        }
        void(^drawDot)(CGFloat,CGFloat)=^(CGFloat u,CGFloat v){
            
            CGPoint dotOrigin = CGPointMake(dotFrame.origin.x+dotFrame.size.width*u,
                                            dotFrame.origin.y+dotFrame.size.height*v );
            CGRect temp;
            temp.origin=dotOrigin;
            temp.size=CGSizeZero;
            CGRect dotRect = CGRectInset(temp, -dotRadius, -dotRadius);
            [[NSBezierPath bezierPathWithOvalInRect:dotRect] fill];
        };
        
//        [self randomize];
//        NSLog(@"self.intValue = %ld",self.intValue);
        
        drawDot(0.5,0.5);
        
//        drawDot(0,1);
//        drawDot(1,0);
        
//        NSMutableArray*array1=[[NSMutableArray alloc]init];
//        [array1 addObject:];
        
        

    }
    
}

- (NSSize)intrinsicContentSize
{
    return CGSizeMake(20, 20);
}

//-(void)drawDot:(CGFloat)u:(CGFloat)v:(CGFloat*)dotFrame
//{
//    dotOrigin = CGPointMake(u, v);
//}

- (void)mouseDown:(NSEvent *)event
{
    NSLog(@"mouseDown");
    _pressed = YES;
    CGFloat edgeLength ;
    CGRect dieFrame;
    [self metricsForSize:self.bounds.size :&edgeLength :&dieFrame];
    NSPoint pointView= [self convertPoint:event.locationInWindow fromView:nil];
    _pressed=CGRectContainsPoint(dieFrame, pointView);
    
}

- (void)mouseDragged:(NSEvent *)event
{
    NSLog(@"mouseDragged");
}

- (void)mouseUp:(NSEvent *)event
{
    NSLog(@"mouseUp");
    NSLog(@"event.clickCount = %ld",(long)event.clickCount);
    if(event.clickCount == 2)
    {
        [self randomize];
        NSLog(@"self.intValue = %ld",self.intValue);
    }
    _pressed =NO;
}

-(void)randomize
{
    self.intValue =arc4random_uniform(5);
//    NSLog(@"_intValue = %ld",_intValue);
}



@end
