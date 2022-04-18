//
//  AppDelegate.m
//  RGBWell
//
//  Created by Aron Ruan on 2022/3/31.
//

#import "AppDelegate.h"
#import "MainWindowsController.h"


@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
//    MainWindowsController *mainWindowController=[[MainWindowsController alloc]initWithWindowNibName:@"MainWindowsController"];
    MainWindowsController *mainWindowController=[[MainWindowsController alloc]init];
    
    [mainWindowController showWindow:self];
    
//    self.mainWindowsController=mainWindowController;
    
    [self setMainWindowsController:mainWindowController];
    
//    self.r=0;
//    self.g=0;
//    self.b=0;
//    self.a=1;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
