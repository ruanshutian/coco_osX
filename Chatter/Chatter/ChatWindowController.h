//
//  ChatWindowController.h
//  Chatter
//
//  Created by Aron Ruan on 2022/5/12.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatWindowController : NSWindowController

@property(nonatomic)NSAttributedString*log;
@property(nonatomic)NSString*message;
@property(nonatomic,weak)IBOutlet NSTextView*textView;
@property(nonatomic,weak)IBOutlet NSTextField*initialFirstResponder;
@property(nonatomic)NSNotificationCenter * _Nonnull notificationCenter;

-(void)receiveDidSendMessageNotification:(NSNotification*)note;

@end

NS_ASSUME_NONNULL_END
