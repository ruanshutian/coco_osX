//
//  MainWindowController.m
//  Thermostat
//
//  Created by Aron Ruan on 2022/4/3.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(instancetype)init
{
    self=[super init];
    if(self)
    {
        self.temperature=68;
    }
    return self;
}
-(void)setTemperature:(NSInteger)temperature
{
    privateTemperature=temperature;
}
-(NSInteger)temperature{
    return privateTemperature;
}

-(NSNibName)windowNibName
{
    return @"MainWindowController";
}
- (IBAction)makeWarmer:(id)sender {
//    NSInteger newTemperature=self.temperature+1;
//    self.temperature=newTemperature;
//    willChangeValueForKey
    [self willChangeValueForKey:@"temperature"];
    self.temperature++;
    [self didChangeValueForKey:@"temperature"];
}

- (IBAction)makeCooler:(id)sender {
    
//    NSInteger newTemperature=self.temperature-1;
//    self.temperature=newTemperature;
    self.temperature--;
}

- (IBAction)updateSwitch:(id)sender {
    
    self.warmerButton.enabled=YES;
    self.coolerButton.enabled=YES;
    self.temperatureSlider.enabled=YES;
    
}


@end
