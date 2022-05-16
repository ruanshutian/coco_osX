//
//  NSView+DieView.h
//  Dice
//
//  Created by Aron Ruan on 2022/5/12.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSView (DieView)

@end

@interface  DieView:NSView

//@property(nonatomic)NSRect bound;
@property(nonatomic)NSInteger intValue;
@end

NS_ASSUME_NONNULL_END
