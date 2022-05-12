//
//  AppDelegate.h
//  Chatter
//
//  Created by Aron Ruan on 2022/5/12.
//

#import <Cocoa/Cocoa.h>
#import "ChatWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic)NSMutableArray<ChatWindowController*>*windowControllers;

@end

