//
//  Employee.m
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/6.
//

#import "Employee.h"

@interface Employee ()

@end

@implementation Employee

//- (void)windowDidLoad {
//    [super windowDidLoad];
//
//    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
//}

//-(void)setName:(NSString *)name
//{
////    _name=@"rst";
//    _name=name;
//}
//-(void)setRaise:(CGFloat)raise
//{
////    _raise=0.05;
//    _raise=raise;
//}
-(instancetype)init
{
    self=[super init];
    if(self)
    {
        _name=@"abcd  ";
        _raise=0.05;
    }
    return self;
}

@end
