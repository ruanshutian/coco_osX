//
//  ConfigurationWindowController.m
//  Dice
//
//  Created by Aron Ruan on 2022/5/17.
//

#import "ConfigurationWindowController.h"

@interface ConfigurationWindowController ()

@end

@implementation DieConfiguration

- (instancetype)init:(NSColor*)color :(NSInteger)rolls
{
    self = [super init];
    if (self) {
        self.color = color;
        self.rolls = MAX(rolls, 1);
    }
    return self;
}

@end

@implementation ConfigurationWindowController


- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (NSNibName)windowNibName
{
    return @"ConfigurationWindowController";
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _color = [NSColor whiteColor];
        _rolls = 10;
    }
    return self;
}

//-(void)setColor:(NSColor*)newValue
//{
//    _color = newValue;
//}
//-(void)setRolls:(NSInteger)newValue
//{
//    _rolls = newValue;
//}
//-(NSColor*)getColor
//{
//    return _color;
//}
//-(NSInteger)getRolls
//{
//    return _rolls;
//}
- (DieConfiguration *)configuration
{
    DieConfiguration *temp = [[DieConfiguration alloc] init:_color :_rolls];
    return temp;
}
- (void)setConfiguration:(DieConfiguration *)configuration
{
    _color = configuration.color;
    _rolls = configuration.rolls;
}

- (IBAction)cancelButtonClicked:(id)sender {
    NSLog(@"Cancel Clicked");
    [self dismissWithModalResponse:NSModalResponseCancel];
}
- (IBAction)okayButtonClicked:(id)sender {
    NSLog(@"OK Clicked");
    [self.window endEditingFor:nil];
    [self dismissWithModalResponse:NSModalResponseOK];
}
-(void)dismissWithModalResponse:(NSModalResponse)response
{
//    self.window.
    [[self.window sheetParent] endSheet:self.window returnCode:response];
}

@end
