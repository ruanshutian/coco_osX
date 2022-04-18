//
//  AppDelegate.m
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/1.
//

#import "AppDelegate.h"
#import "mainWindowController.h"
@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
//    mainWindowController *mainWindow = [[mainWindowController alloc]initWithWindowNibName:@"mainWindowController"];
    mainWindowController *mainWindow =[[mainWindowController alloc]init];
    
    [mainWindow showWindow:self];
    
//    self.mainWindow=mainWindow;
    
//    [self.mainWindow setWindow:mainWindow];
    
    self.mainWindow=mainWindow;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
