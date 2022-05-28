//
//  AppDelegate.m
//  AutoLabelOutApp
//
//  Created by Aron Ruan on 2022/5/18.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSTextField*label = [[NSTextField alloc] initWithFrame:NSZeroRect];
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
//    label.translatesAutoresizingMaskIntoConstraints = YES;
    label.stringValue =@"label";
    label.backgroundColor = [NSColor clearColor];
    label.editable = NO;
    label.selectable =NO;
    label.bezeled = NO;
    
    NSTextField*textField= [[NSTextField alloc] initWithFrame:NSZeroRect];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
//    textField.translatesAutoresizingMaskIntoConstraints = YES;
    textField.action = @selector(takeStringValueFrom:);
    textField.target = label;
    
    NSView *superview = (NSView*)self.window.contentView;
    
    [superview addSubview:label];
    [superview addSubview:textField];
    
    NSArray<NSLayoutConstraint *> * horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[label]-[textField(>=100)]-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:@{@"label":label,@"textField":textField}];
    [NSLayoutConstraint activateConstraints:horizontalConstraints];
    NSArray<NSLayoutConstraint *> * verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[textField]-|" options:0 metrics:nil views:@{@"textField":textField}];
    [NSLayoutConstraint activateConstraints:verticalConstraints];
    
//    [superview addConstraint:verticalConstraints];
//    [self.window visualizeConstraints:superview.constraints];
//    [superview updateConstraintsForSubtreeIfNeeded];
//    if([superview hasAmbiguousLayout])
//    {
//        [superview exerciseAmbiguityInLayout];
//    }
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
