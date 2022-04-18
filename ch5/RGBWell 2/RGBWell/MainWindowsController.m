//
//  MainWindowsController.m
//  RGBWell
//
//  Created by Aron Ruan on 2022/3/31.
//

#import "MainWindowsController.h"
#import "AronSlider.h"
#import <Cocoa/Cocoa.h>

@interface MainWindowsController ()

@end

@implementation MainWindowsController

- (instancetype)init {
    self = [super init];
    if (self) {
        //
    }
    
    return self;
}

- (instancetype)initWithWindowNibName:(NSNibName)windowNibName {
    self = [super initWithWindowNibName:windowNibName];
    if (self) {
        self.r = 0.6;
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
//    self.aSlider = [[AronSlider alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//    [self.aSlider setDoubleValue:0.3];
//    
//    [self.window.contentView addSubview:self.aSlider];
    
    [self.rSlider setDoubleValue:self.r];
    [self.gSlider setDoubleValue:self.g];
    [self.bSlider setDoubleValue:self.b];
    
    [self updateColor];
}

-(NSString*)windowNibName {
    return @"MainWindowsController";
}

- (IBAction)adjustRed:(id)sender {
    
//    NSInteger a=[sender integerValue];
    
    //换成浮点数
//    NSString *a =[sender stringValue];
    self.r= [sender doubleValue];
    
    NSLog(@"R %f",self.r);
    [self updateColor];
}

- (IBAction)adjustGreen:(id)sender {
//    NSString *a =[sender stringValue];
    self.g= [sender doubleValue];
    
    NSLog(@"G   %f",self.g);
    [self updateColor];
}
- (IBAction)adjustBlue:(id)sender {
//    NSString *a =[sender stringValue];
    self.b = [sender doubleValue];
    
    NSLog(@"B   %f",self.b);
    [self updateColor];
}
-(void)updateColor{
//    NSLog(@"%@",self.r);
    self.a=1;
    NSLog(@" R = %f, G = %f , B = %f  ,a = %lf  ",self.r,self.g,self.b,self.a);

//    self.colorWell=newColor;
//    NSColor *newColor=[[NSColor alloc]]
    [self.colorWell setColor:[NSColor colorWithCalibratedRed:self.r green:self.g blue:self.b alpha:self.a]];
//    [self.colorWell setColor:[NSColor colorWithRed:self.r green:self.g blue:self.b alpha:self.a]];
}

@end
