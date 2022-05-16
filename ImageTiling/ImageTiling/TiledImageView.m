//
//  TiledImageView.m
//  ImageTiling
//
//  Created by Aron Ruan on 2022/5/13.
//

#import "TiledImageView.h"

//@implementation IB_DESIGNABLE TiledImageView

@implementation IB_DESIGNABLE TiledImageView

NSInteger columnCount = 5;
NSInteger rowCount = 5;

- (instancetype)init
{
    NSLog(@"init");
    self = [super init];
    if(self){
        _columnCount = 5;
        _rowCount = 5;
        _image = [[NSImage alloc] init];
//        NSLog(@"self.intrinsicContentSize  = %@",self.intrinsicContentSize );
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSLog(@"drawRect");
    NSImage *image = [[NSImage alloc]init];
    image = self.image;
    
//    NSLog(@"intrinsicContentSize = %ld",self.intrinsicContentSize);
//    CGRect furthestFrame = [self frameForImageAtLogicalX:columnCount-1 :rowCount-1];
//    self.intrinsicContentSize = NSMakeSize(furthestFrame.origin.x, furthestFrame.origin.y);
    
//    NSLog(@"[self columnCount] = %ld",_columnCount);
    for(NSInteger x =0;x<columnCount;x++)
    {
        for(NSInteger y=0;y<rowCount;y++)
        {
            CGRect frame = [self frameForImageAtLogicalX:x :y];
            [image drawInRect:frame];
        }
    }
    
}



- (NSSize)intrinsicContentSize
{
    NSLog(@"intrinsicContentSize");
    CGRect furthestFrame = [self frameForImageAtLogicalX:columnCount-1 :rowCount-1];
    
    NSSize res = NSMakeSize(furthestFrame.size.width, furthestFrame.size.height);
//    NSSize res = NSMakeSize(4, 40);
    return res;
}

-(CGRect)frameForImageAtLogicalX:(NSInteger)logicalX:(NSInteger)logicalY
{
//    NSLog(@"frameForImageAtLogicalX");
    NSInteger spacing =10 ;
    NSInteger width = 100;
    NSInteger height = 100;
    NSInteger x = (spacing + width )*logicalX;
    NSInteger y = (spacing + height )*logicalY;
    
    return  CGRectMake(x, y, width, height);
    
}

@end
