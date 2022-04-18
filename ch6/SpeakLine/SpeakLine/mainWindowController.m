//
//  mainWindowController.m
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/1.
//

#import "mainWindowController.h"

@interface mainWindowController ()

@end

@implementation mainWindowController

- (void)windowDidLoad {
    
    NSLog(@"   windowDidLoad   ");
    
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    [self updateButtons];
    self.speechSynth =[[NSSpeechSynthesizer alloc]init];
    self.speechSynth.delegate = self;
//    self.speechSynth = [[NSSpeechSynthesizer alloc] init];
//    self.speechSynth.delegate=self;
//    [self.speechSynth setDelegate:self];
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
        NSLog(@"   init   ");
        self.isStarted = FALSE;
        //回调？
    }
    
    return self;
}

- (IBAction)stopIt:(id)sender {
    
    NSLog(@"stop button clicked");
    [self.speechSynth stopSpeaking];
    
    self.isStarted=FALSE;
}

- (void)setIsStarted:(BOOL)isStarted {
    NSLog(@"setIsStarted:  isStarted  == %d, _isStarted = %d",isStarted,_isStarted);
    
    if (isStarted == _isStarted) {
        return;
    }
//    NSLog(@"isStarted  %d",self.isStarted);
    _isStarted=isStarted;
    [self updateButtons];
}

- (IBAction)speakIt:(id)sender {
    
    NSLog(@"   speakIt   ");
    
    NSString *s = [[NSString alloc]init];
    
    s=[self.textField stringValue];
    if(s.length==0)
    {
        NSLog(@" s is empty");
    }
    else
    {
        NSLog(@" s is %@ ",s);
//        NSSpeechSynthesizer *ss=[[NSSpeechSynthesizer alloc]init];
        
        [self.speechSynth startSpeakingString:s];
//        [_speechSynth startSpeakingString:s];
//        NSLog(@"%d",[self.speechSynth startSpeakingString:@"dsdfdsfsf"
//                     ]);
        NSLog(@"_isStarted  == %d,self.isStarted = %d",_isStarted,self.isStarted);
        self.isStarted=TRUE;
        NSLog(@"after changed:  _isStarted  == %d,self.isStarted = %d",_isStarted,self.isStarted);
        
    }
    
}

-(void)updateButtons{
    NSLog(@"updateButtons   _isStarted  == %d,self.isStarted = %d",_isStarted,self.isStarted);
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
    NSLog(@"   speechSynthesizer  didFinishSpeaking");
    self.isStarted=FALSE;
    NSLog(@"finishedSpeaking=\(finishedSpeaking)");
    
}

-(BOOL)windowShouldClose:(NSWindow *)sender
{
    BOOL f=_isStarted;
    return !f;
}


@end
