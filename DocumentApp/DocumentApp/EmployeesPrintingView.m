//
//  EmployeesPrintingView.m
//  DocumentApp
//
//  Created by Aron Ruan on 2022/5/19.
//

#import "EmployeesPrintingView.h"

@implementation EmployeesPrintingView

- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    self.nameRect = NSMakeRect(self.pageRect.origin.x, 0, 100.0, _lineHeight);
    self.raiseRect = NSMakeRect(self.nameRect.origin.x+self.nameRect.size.width, 0, 100.0, _lineHeight);
    
//    for(NSInteger indexOnPage = 0;indexOnPage<5;indexOnPage++)
//    {
//        
//    }
    
    for(NSInteger indexOnPage = 0;indexOnPage<_linesPerPage;indexOnPage++)
    {
//        NSInteger indexOnPage =1;
//        indexOnPage = indexOnPage+1;
        NSInteger indexInEmployees = _currentPage * _linesPerPage +indexOnPage;
        
        if(indexInEmployees >= [_employees count])
        {
            break;
        }
        
        Employee *employee = _employees[indexInEmployees];
//        self.nameRect.origin.y = self.pageRect.origin.y +(CGFloat)indexOnPage *_lineHeight;
        _nameRect.origin.y = _pageRect.origin.y+(CGFloat)indexOnPage *_lineHeight;
        NSString* emplyeeName = employee.name;
//        NSString* emplyeeName = @"NSString* emplyeeName";
        NSLog(@"indexInEmployees = %ld",indexInEmployees);
        NSLog(@"emplyeeName = %@",emplyeeName);
        NSMutableString* indexAndName =[NSMutableString stringWithFormat:@"%ld   %@   ",indexInEmployees,emplyeeName];
//        NSMutableString* indexAndName = @"indexAndName";
        NSLog(@"indexAndName = %@",indexAndName);
        [indexAndName drawInRect:self.nameRect withAttributes:_textAtrributes];
        
        _raiseRect.origin.y = self.nameRect.origin.y;
        NSMutableString*raise = [NSMutableString stringWithFormat:@"%4.1f%@",employee.raise*100,@"%"];
        NSMutableString*raiseString = raise;
        NSLog(@"raiseString = %@",raiseString);
        NSLog(@"_textAtrributes = %@",_textAtrributes);
//        [raiseString appendFormat:@"%@", indexAndName];
        [raiseString drawInRect:_raiseRect withAttributes:_textAtrributes];
////        [raiseString drawInRect:<#(NSRect)#> withAttributes:(nullable NSDictionary<NSAttributedStringKey,id> *)]
    }
    
    
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
        _font = [NSFont userFixedPitchFontOfSize:(CGFloat)12.0];
        _textAtrributes = [[NSMutableDictionary alloc] init];
        _lineHeight = _font.capHeight*2.0;
        _employees = [[NSMutableArray alloc] init];
        _pageRect = NSZeroRect;
        _linesPerPage = 0;
        _currentPage = 0;
        _nameRect = NSMakeRect(_pageRect.origin.x, 0, 200.0, _lineHeight);
        _raiseRect = NSMakeRect(_nameRect.origin.x, 0, 100.0, _lineHeight);
    }
    return  self;
}

- (void)setEmployees:(NSMutableArray<Employee *> *)employees
{
    _employees = employees;
//    [super setFrame:NSZeroRect];
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    assert("EmployeesPrintingView cannot be instantiated from a nib");
    return self;
}

- (BOOL)knowsPageRange:(NSRangePointer)range
{
    NSPrintOperation *printOperation = [NSPrintOperation currentOperation];
    
    NSPrintInfo *printInfo = [printOperation printInfo];
    
    self.pageRect = printInfo.imageablePageBounds;
    
    NSRect newFrame;
    newFrame.size = printInfo.paperSize;
//    newFrame.origin = CGPointMake(0, 0);
    self.frame = newFrame;
    
    self.linesPerPage = (NSInteger)(self.pageRect.size.height/_lineHeight);
    
    NSRange rangeOut ;
    rangeOut.location = 0;
    rangeOut.length = 0;
    
    rangeOut.location = 1;
    
    rangeOut.length = [self.employees count]/self.linesPerPage;
    
    if([self.employees count]%self.linesPerPage>0)
    {
        rangeOut.length +=1;
    }
    
    //
    *range = rangeOut;
    
    
    return YES;
}

- (NSRect)rectForPage:(NSInteger)page
{
    _currentPage = page-1;
    
    return self.pageRect;
    
}

- (BOOL)isFlipped
{
    return YES;
}



@end
