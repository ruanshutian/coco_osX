//
//  ChatWindowController.m
//  Chatter
//
//  Created by Aron Ruan on 2022/5/12.
//

#import "ChatWindowController.h"

@interface ChatWindowController ()

@end

@implementation ChatWindowController

NSString*ChatWindowControllerDidSendMessageNotification=@"com.bignerdranch.chatter.ChatWindowControllerDidSendMessageNotification";
NSString*ChatWindowControllerMessageKey=@"com.bignerdranch.chatter.ChatWindowControllerMessageKey";

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSLog(@"windowDidLoad  ");
    [_notificationCenter addObserver:self selector:@selector(receiveDidSendMessageNotification:) name:ChatWindowControllerDidSendMessageNotification object:nil];
    
    
}

- (NSNibName)windowNibName
{
    return @"ChatWindowController";
}
- (instancetype)init{
    self = [super init];
    if(self)
    {
        _log = [[NSAttributedString alloc]initWithString:@""];
        _message = [[NSString alloc]init];
//        _textView = [[NSTextView alloc]init];
        _notificationCenter = [NSNotificationCenter defaultCenter];
    }
    return  self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self=[super initWithCoder:coder];
    NSLog(@"initWithCoder");
    return self;
}

- (IBAction)send:(id)sender {
    NSLog(@"send");
    NSLog(@"message = %@",_message);
    
    NSWindow * window = [sender window];
    [window endEditingFor:nil];
    if(_message)
    {
        NSDictionary*userInfo = @{ChatWindowControllerMessageKey:_message};
        NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter postNotificationName:ChatWindowControllerDidSendMessageNotification object:self userInfo:userInfo];
        
//        [_notificationCenter addObserver:self selector:@selector(receiveDidSendMessageNotification:) name:ChatWindowControllerDidSendMessageNotification object:nil];
        
    }
    self.message =@"";
    
}

-(void)receiveDidSendMessageNotification:(NSNotification*)note{
    NSMutableAttributedString* mutableLog = [_log mutableCopy];
    
//    NSLog(@"receiveDidSendMessageNotification");
    
//    NSMutableAttributedString*temp_n =[[NSMutableAttributedString alloc]initWithString:@"\n"];
    if([_log length]>0)
    {
        [mutableLog appendAttributedString:[[NSMutableAttributedString alloc]initWithString:@"\n"]];
//        NSLog(@"mutableLog = %@",mutableLog);
    }

    NSDictionary*userInfo = note.userInfo;
    _message = userInfo[ChatWindowControllerMessageKey];
    NSAttributedString *logLine = [[NSAttributedString alloc]initWithString:_message];

    [mutableLog appendAttributedString:logLine];

    self.log = [mutableLog copy];
    [_textView scrollRangeToVisible:(NSRange){.location=[_log length],.length =0 }];
    NSLog(@"log = %@",_log);
//    [_notificationCenter removeObserver:self];
}



@end
