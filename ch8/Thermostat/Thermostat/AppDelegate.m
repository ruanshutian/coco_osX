//
//  AppDelegate.m
//  Thermostat
//
//  Created by Aron Ruan on 2022/4/3.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    MainWindowController *mainWindowController =[[MainWindowController alloc]init];
    
    [mainWindowController showWindow:self];
    
    self.mainWindowController=mainWindowController;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
