//
//  MainWindowController.m
//  RandomPassword2
//
//  Created by Aron Ruan on 2022/3/31.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

//NSTextField *textField = [[NSTextField alloc] ]

- (void)windowDidLoad {
    [super windowDidLoad];
    // S
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
//    self.textField
    
}
- (IBAction)generatePassword:(id)sender {
    NSLog(@"1111");
    
    [self.textField setStringValue:@"button clicked"];
    
}

//- (void)awakeFromNib {
//
//}

@end
