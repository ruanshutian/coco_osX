//
//  AppDelegate.m
//  Chatter
//
//  Created by Aron Ruan on 2022/5/12.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

-(void)addWindowController
{
    ChatWindowController *windowController = [[ChatWindowController alloc]init];
    [windowController showWindow:self];
    [_windowControllers addObject:windowController];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _windowControllers=[[NSMutableArray alloc]init];
    
    [self addWindowController];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction)displayNewWindow:(id)sender {
    [self addWindowController];
}

@end
