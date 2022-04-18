//
//  mainWindowController.h
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/1.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface mainWindowController : NSWindowController<NSSpeechSynthesizerDelegate,NSWindowDelegate,NSTableViewDataSource,NSTableViewDelegate>

@property(weak)IBOutlet NSTextField *textField;
@property(weak)IBOutlet NSButton *speakButton;
@property(weak)IBOutlet NSButton *stopButton;

@property(weak)IBOutlet NSTableView *tableview;

@property(nonatomic)BOOL isStarted;

@property(nonatomic, strong) NSSpeechSynthesizer *speechSynth;
@property(nonatomic,strong)NSArray *voices;



-(void)updateButtons;
-(NSString*)voiceNameForIdentifier:(NSSpeechSynthesizerVoiceName)identifier;

@end

NS_ASSUME_NONNULL_END
