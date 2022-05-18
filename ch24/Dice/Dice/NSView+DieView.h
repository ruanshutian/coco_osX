//
//  NSView+DieView.h
//  Dice
//
//  Created by Aron Ruan on 2022/5/12.
//

#import <Cocoa/Cocoa.h>
#import "ConfigurationWindowController.h""

NS_ASSUME_NONNULL_BEGIN

@interface NSView (DieView)

@end

@interface NSString (NSString)

@end

@interface  DieView:NSView<NSDraggingSource>

//@property(nonatomic)NSRect bound;
@property(nonatomic)NSInteger intValue;
@property(nonatomic)BOOL pressed;
@property(nonatomic)NSEvent *mouseDownEvent;
@property(nonatomic)BOOL highlightForDragging;
@property(nonatomic)NSInteger rollsRemaining;

@property(nonatomic)NSColor* color;
@property(nonatomic)NSInteger numberOfTimesToRoll;

//-(void)rollTick:(NSTimer*)sender;

@end

NS_ASSUME_NONNULL_END
