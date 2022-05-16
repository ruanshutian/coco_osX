//
//  AppDelegate.m
//  ImageTiling
//
//  Created by Aron Ruan on 2022/5/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    MainWindowController *mainWindowController = [[MainWindowController alloc] init];
    
    [mainWindowController showWindow:self];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
