//
//  MainWindowController.h
//  Thermostat
//
//  Created by Aron Ruan on 2022/4/3.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainWindowController : NSWindowController
{
    @private
    NSInteger privateTemperature;
}
//dynamic

@property(nonatomic) NSInteger temperature;
@property(nonatomic)BOOL isOn;

@property(nonatomic,strong)IBOutlet NSButton *warmerButton;
@property(nonatomic,strong)IBOutlet NSButton *coolerButton;
@property(nonatomic,strong)IBOutlet NSSlider *temperatureSlider;

@end

NS_ASSUME_NONNULL_END
