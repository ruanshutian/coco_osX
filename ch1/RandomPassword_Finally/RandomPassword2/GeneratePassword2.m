//
//  GeneratePassword2.m
//  RandomPassword2
//
//  Created by Aron Ruan on 2022/3/31.
//

#import "GeneratePassword2.h"

@interface GeneratePassword2 ()

@end

@implementation GeneratePassword2

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
-(NSString*)generateRandomString
{
    NSString *s=@"This is randomString";
    NSLog(@"%@",s);
    return s;
}
@end
