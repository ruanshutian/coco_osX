//
//  AppDelegate.m
//  Dice
//
//  Created by Aron Ruan on 2022/5/12.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    MainWindowController*mainWindowController = [[MainWindowController alloc]init];
    
    [mainWindowController showWindow:self];
    
    self.mainController = mainWindowController;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
