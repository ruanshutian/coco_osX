//
//  MainWindowController.m
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/29.
//
#import "MainViewController.h"
#import "MainWindowController.h"

@interface MainWindowController ()
@property (nonatomic) MainViewController*mainViewController;
//@property (nonatomic) NSWindow *windows;
@end

@implementation MainWindowController

//- (instancetype)initWithWindow:(NSWindow *)window
//{
//    self = [super initWithWindow:window];
//    if(self)
//    {
//        NSLog(@"initWithWindow");
//        self.window = [[NSWindow alloc]initWithContentRect:NSMakeRect(0, 0, 500, 500) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable
//                                              backing:NSBackingStoreBuffered defer:NSBackingStoreBuffered ? YES : NO ];
//        self.window.title = @"ZhiHuDaily";
//        self.window.contentViewController = [[MainViewController alloc] init];
//    }
//    return self;
//}
- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"windowDidLoad");
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    //设置window窗口属性——大小标题等
    
    self.window = [[NSWindow alloc]initWithContentRect:NSMakeRect(0, 0, 500, 500) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable
                                          backing:NSBackingStoreBuffered defer:NSBackingStoreBuffered ? YES : NO ];
    [self.window setFrame:NSMakeRect(0, 0, 500, 500) display:YES];
    self.window.title = @"ZhiHuDaily";
    self.window.contentViewController = [[MainViewController alloc] init];
}

- (NSNibName)windowNibName
{
    NSLog(@"windowNibName");
    return @"MainWindowController";
}

//- (NSWindow *)window
//{
////    NSWindow* windows = [[NSWindow alloc]initWithContentRect:NSMakeRect(0, 0, 500, 500) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable
////                                                              backing:NSBackingStoreBuffered defer:NSBackingStoreBuffered ? YES : NO ];
////    windows.title = @"xxxx";
//
//    return self.window;
//}

//+ (instancetype)windowWithContentViewController:(NSViewController *)contentViewController API_AVAILABLE(macos(10.10))
//{
////    self.window = [[NSWindow alloc]initWithContentRect:NSMakeRect(0, 0, 500, 500) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable
////                                          backing:NSBackingStoreBuffered defer:NSBackingStoreBuffered ? YES : NO ];
////    [self.window setFrame:NSMakeRect(0, 0, 500, 500) display:YES];
////    self.window.title = @"ZhiHuDaily";
//    NSLog(@"22");
//    MainWindowController *main = [[MainWindowController alloc]init];
//    main.window =[[NSWindow alloc]initWithContentRect:NSMakeRect(0, 0, 500, 500) styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskResizable
//                                                            backing:NSBackingStoreBuffered defer:NSBackingStoreBuffered ? YES : NO ];
//    return main;
//}

@end
