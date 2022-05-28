//
//  EmployeesPrintingView.h
//  DocumentApp
//
//  Created by Aron Ruan on 2022/5/19.
//

#import <Cocoa/Cocoa.h>
#import "Employee.h"
NS_ASSUME_NONNULL_BEGIN

@interface EmployeesPrintingView : NSView
{
    NSFont *_font;
    NSMutableDictionary<NSString*,id> *_textAtrributes;
    CGFloat _lineHeight;
};

@property(nonatomic)NSMutableArray<Employee*>*employees;
@property(nonatomic)NSRect pageRect;
@property(nonatomic)NSInteger linesPerPage;
@property(nonatomic)NSInteger currentPage;

@property(nonatomic)NSRect nameRect;
@property(nonatomic)NSRect raiseRect;


@end

NS_ASSUME_NONNULL_END
