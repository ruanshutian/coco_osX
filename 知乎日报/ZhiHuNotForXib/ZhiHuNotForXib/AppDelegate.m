//
//  AppDelegate.m
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/29.
//
#import "MainSplitView.h"
#import "MainViewController.h"
#import "MainWindowController.h"
#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic) NSWindow *window1;
@property (nonatomic) MainSplitView *mainSplitView;
 //@property (strong) IBOutlet NSWindow *window;
@property (nonatomic) MainWindowController*mainWindowController;

@end

@implementation AppDelegate

- (NSWindow *)window1
{
    if(!_window1)
    {
        _window1 = [[NSWindow alloc]initWithContentRect:NSMakeRect(0, 0, 800, 600) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable
                                                backing:NSBackingStoreBuffered defer:NSBackingStoreBuffered ? YES : NO];
//        _mainSplitView = [[MainSplitView alloc] initWithFrame:CGRectMake(_window1.frame.origin.x, _window1.frame.origin.y, _window1.frame.size.width, _window1.frame.size.height)];
        _mainSplitView = [[MainSplitView alloc] initWithFrame:_window1.contentView.frame];


        
    }
    return _window1;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
//    self.mainWindowController = [[MainWindowController alloc] init];
////    self.mainWindowController.window = [self createNewWindow];
//    NSLog(@"%f  %f",self.mainWindowController.window.frame.size.width,self.mainWindowController.window.frame.size.height);
////    self.mainWindowController.contentViewController = [[MainViewController alloc] init];
//    [self.mainWindowController showWindow:self.mainWindowController.window];
    [self.window1 center];
    [self.window1 orderFront:nil];
    [self.window1.contentView addSubview:self.mainSplitView];
//    self.window1.contentViewController = [[MainViewController alloc] init];
    
    
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}
-(NSWindow*)createNewWindow
{
    NSWindow*windows = [[NSWindow alloc]initWithContentRect:NSMakeRect(0, 0, 800, 600) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable
                                                   backing:NSBackingStoreBuffered defer:NSBackingStoreBuffered ? YES : NO ];
    windows.title =@"main";
    return windows;
}



@end
