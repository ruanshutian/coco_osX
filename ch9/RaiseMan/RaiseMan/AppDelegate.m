//
//  AppDelegate.m
//  RaiseMan
//
//  Created by Aron Ruan on 2022/4/6.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    Document *main=[[Document alloc]init];
    
    [main showWindow:self];
    
    self.main=main;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
