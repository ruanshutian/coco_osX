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

- (IBAction)showDieConfiguration:(id)sender {
    NSWindow *window =self.window;
    DieView * dieView =[[DieView alloc] init];
    dieView = (DieView *)window.firstResponder;
    
    ConfigurationWindowController *windowController = [[ConfigurationWindowController alloc]init];
//    DieConfiguration *configuration = [[DieConfiguration alloc] init];
    windowController.configuration =[[DieConfiguration alloc] init];
    windowController.configuration.color = dieView.color;
    windowController.configuration.rolls = dieView.numberOfTimesToRoll;
    
    [window beginSheet:windowController.window completionHandler:^(NSModalResponse returnCode) {
        if(returnCode == NSModalResponseOK)
        {
            DieConfiguration* configuration = self.configurationWindowController.configuration;
            dieView.color = configuration.color;
            dieView.numberOfTimesToRoll = configuration.rolls;
        }
        self.configurationWindowController =nil;
    }];
    
    [windowController showWindow:self];
    
    self.configurationWindowController =windowController;
}


@end
