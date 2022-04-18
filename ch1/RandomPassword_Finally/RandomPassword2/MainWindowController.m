//
//  MainWindowController.m
//  RandomPassword2
//
//  Created by Aron Ruan on 2022/3/31.
//

#import "MainWindowController.h"
#import "GeneratePassword2.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

//NSTextField *textField = [[NSTextField alloc] ]

//-(NSString*) generateRandomString
//{
//    NSString *s=@"This is randomString";
//    return s;
//}

- (void)windowDidLoad {
    [super windowDidLoad];
    // S
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
//    self.textField
    
}
- (IBAction)generatePassword:(id)sender {
//    NSLog(@"1111");
    NSString *res=[[NSString alloc]init];
    
    GeneratePassword2 *g=[[GeneratePassword2 alloc]init];
    res = @"button clicked";
    res = [g generateRandomString];
    NSLog(@"g = %@",g);
    
    [self.textField setStringValue:res];
    
}

//- (void)awakeFromNib {
//
//}

@end
