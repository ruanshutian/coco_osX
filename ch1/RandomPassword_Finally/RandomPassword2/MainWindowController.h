//
//  MainWindowController.h
//  RandomPassword2
//
//  Created by Aron Ruan on 2022/3/31.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainWindowController : NSWindowController

//@property(nonatomic)NSTextField *textField;
@property(weak) IBOutlet NSTextField *textField;

//-(NSString*) generateRandomString;

@end

NS_ASSUME_NONNULL_END
