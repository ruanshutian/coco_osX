//
//  mainWindowController.m
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/1.
//

#import "mainWindowController.h"

@interface KVOClass : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *name2;
@end

@implementation KVOClass

- (void)setName:(NSString *)name {
    
}

- (void)setName2:(NSString *)name2 {

}

@end

@interface mainWindowController ()

@end

@implementation mainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self updateButtons];
    self.speechSynth.delegate=self;
//    [self.speechSynth.delegate self];
    
}

-(NSNibName)windowNibName
{
    return @"mainWindowController";
}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//{
//    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
//    NSString *newValue =[change objectForKey:NSKeyValueChangeNewKey];
//    NSLog(@"  %@   %@   ",  oldValue,newValue);
//}

-(instancetype)init
{
    self=[super init];
    
    if(self)
    {
        self.isStarted = FALSE;

        //回调？
//        NSString *start =[[NSString alloc]init];
//        start = _isStarted;
//        [self addObserver:self forKeyPath:start options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//        [self updateButtons];
        
//        NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self.isStarted selector:(self.updateButtons) userInfo:nil repeats:YES];
        
    }
    
    return self;
}

- (IBAction)stopIt:(id)sender {
    
//    NSLog(@"stop button clicked");
    
    [self.speechSynth stopSpeaking];
    
//    self.isStarted=FALSE;
}

- (void)setIsStarted:(BOOL)isStarted {
    if (isStarted == _isStarted) {
        return;
    }
    
    _isStarted = isStarted;
}

- (IBAction)speakIt:(id)sender {
    NSString *s = [[NSString alloc]init];
    
    s=[self.textField stringValue];
    if(s.length==0)
    {
        NSLog(@" s is empty");
    }
    else
    {
        NSLog(@" s is %@ ",s);
        NSSpeechSynthesizer *ss=[[NSSpeechSynthesizer alloc]init];
        [ss startSpeakingString:s];
        
//        [self.speechSynth startSpeakingString:s];
//        NSLog(@"%d",[self.speechSynth startSpeakingString:@"dsdfdsfsf"
//                     ]);
        
        self.isStarted=TRUE;
    }
    
}

-(void)updateButtons{
    
    if(self.isStarted){
        self.speakButton.enabled =FALSE;
        self.stopButton.enabled=TRUE;
    }
    else{
        self.stopButton.enabled=FALSE;
        self.speakButton.enabled=TRUE;
    }
    
}

-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    self.isStarted=FALSE;
    NSLog(@"finishedSpeaking=\(finishedSpeaking)");
    
}

-(BOOL)windowShouldClose:(NSWindow *)sender
{
    BOOL f=self.isStarted;
    return !f;
}

@end
