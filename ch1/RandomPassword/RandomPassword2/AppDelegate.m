//
//  AppDelegate.m
//  RandomPassword2
//
//  Created by Aron Ruan on 2022/3/31.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    MainWindowController *mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
    
    [mainWindowController showWindow:self];
    
    self.mainWindowController = mainWindowController;
    
    NSLog(@"hh");
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
