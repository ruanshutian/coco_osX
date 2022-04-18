//
//  AppDelegate.h
//  Thermostat
//
//  Created by Aron Ruan on 2022/4/3.
//

#import <Cocoa/Cocoa.h>
#import "MainWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic,strong)MainWindowController*mainWindowController;

@end

