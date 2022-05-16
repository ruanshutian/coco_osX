//
//  MainWindowController.m
//  Dice
//
//  Created by Aron Ruan on 2022/5/12.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSLog(@"windowDidLoad");
    
    
}
- (instancetype)init{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

- (NSNibName)windowNibName
{
    return @"MainWindowController";
}



@end
