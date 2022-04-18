//
//  mainWindowController.h
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/1.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface mainWindowController : NSWindowController<NSSpeechSynthesizerDelegate,NSWindowDelegate>

@property(weak)IBOutlet NSTextField *textField;
@property(weak)IBOutlet NSButton *speakButton;
@property(weak)IBOutlet NSButton *stopButton;

@property(nonatomic)BOOL isStarted;

@property NSSpeechSynthesizer *speechSynth;

-(void)updateButtons;

@end

NS_ASSUME_NONNULL_END
