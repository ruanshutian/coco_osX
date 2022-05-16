//
//  TiledImageView.h
//  ImageTiling
//
//  Created by Aron Ruan on 2022/5/13.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TiledImageView : NSView
@property(nonatomic)IBInspectable NSImage *image;
//@property(nonatomic) NSImage *image;
@property(nonatomic)NSInteger columnCount;
@property(nonatomic)NSInteger rowCount;

@end

NS_ASSUME_NONNULL_END
