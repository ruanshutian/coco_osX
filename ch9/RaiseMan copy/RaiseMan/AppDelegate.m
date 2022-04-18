//
//  AppDelegate.m
//  RaiseMan
//
//  Created by Aron Ruan on 2022/4/4.
//

#import "AppDelegate.h"
#import "Document.h"
@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
//    Document *document =[[Document alloc]initWithWindowNibName:@"Document"];
    Document *document =[[Document alloc]init];
    
    [document showWindow:self ];
    
    self.document=document;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}




@end
