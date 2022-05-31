//
//  MainWindowController.m
//  ZhiHu
//
//  Created by Aron Ruan on 2022/5/26.
//

#import "MainWindowController.h"
#import "MainViewController.h"
@interface MainWindowController ()
@property(nonatomic)MainViewController*mainView;
@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    self.mainView = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:[NSBundle mainBundle]];
    
    
    self.contentViewController = self.mainView;
    
}

- (NSNibName)windowNibName
{
    return @"MainWindowController";
}

@end
