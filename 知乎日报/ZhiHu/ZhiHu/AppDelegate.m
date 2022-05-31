//
//  AppDelegate.m
//  ZhiHu
//
//  Created by Aron Ruan on 2022/5/26.
//

#import "AppDelegate.h"
#import "MainWindowController.h"
@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property(nonatomic)MainWindowController*mainWindows;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    self.mainWindows = [[MainWindowController alloc] init];
//    [self.mainWindows showWindow:self];
    
    MainWindowController*mainWindowController = [[MainWindowController alloc] init];
    [mainWindowController showWindow:self];
    self.mainWindows = mainWindowController;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
