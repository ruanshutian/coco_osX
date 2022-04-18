//
//  MainWindowsController.h
//  RGBWell
//
//  Created by Aron Ruan on 2022/3/31.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN
@class AronSlider;

@interface MainWindowsController : NSWindowController

//@property(weak)IBOutlet NSColorWell *colorWells;
@property(weak) IBOutlet NSColorWell *colorWell;
@property(weak)IBOutlet NSSlider *rSlider;
@property(weak)IBOutlet NSSlider *gSlider;
@property(weak)IBOutlet NSSlider *bSlider;

//@property(nonatomic, strong) AronSlider *aSlider;
@property(nonatomic, assign) CGFloat r;
@property(nonatomic, assign) CGFloat g;
@property(nonatomic, assign) CGFloat b;
@property(nonatomic, assign) CGFloat a;

//-(void)updateColor;
-(void)updateColor;
@end

NS_ASSUME_NONNULL_END
