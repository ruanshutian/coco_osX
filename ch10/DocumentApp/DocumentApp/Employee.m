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

-(BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError *__autoreleasing  _Nullable *)outError
{
//    if (![inKey isEqualToString:@"raise"]) {
//        return YES;
//    }
    
    BOOL f=[*ioValue isKindOfClass:[NSNumber class]];
    if(f)
    {
        NSLog(@"fff");
    }
    
    if (ioValue == nil || !f) {
        
        NSDictionary *userInfo=@{NSLocalizedDescriptionKey:@"An employee's raise must be a number."};
        NSError *error = [NSError errorWithDomain:@"xxxxxxxx" code:-1 userInfo:userInfo];

        *outError = error;
        return NO;
    }
    
    return  YES;
    
}

@end
