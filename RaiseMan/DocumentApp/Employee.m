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
        _name=@"abcd";
        _raise=2;
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

-(void)encodeWithCoder:(NSCoder *)coder
{
    NSString *name= self.name;
    NSLog(@"encodeWithCoder");
    if(name)
    {
        [coder encodeObject:name forKey:@"name"];
    }
//    [coder encodeObject:name forKey:@"name"];
    [coder encodeFloat:_raise forKey:@"raise"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self=[super init];
    NSLog(@"initWithCoder");
    _name=[coder decodeObjectForKey:@"name"];
    _raise=[coder decodeFloatForKey:@"raise"];

    return self;
}

//-(NSComparisonResult)compareWithOthers:(Employee *)stu {
//    if ([self.name length] > [stu.name length]) {
//        return NSOrderedAscending;
//    }
//
//    if ([self.name length] < [stu.name length]) {
//        return NSOrderedDescending;
//    }
//
//    return NSOrderedSame;
//}



@end
