//
//  mainWindowController.m
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/1.
//

#import "mainWindowController.h"

@interface KVOClass : NSObject

@property (nonatomic, copy) NSString *name;
@property(nonatomic)BOOL isStarted;



@end

@implementation KVOClass
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
        self.kvo = [[KVOClass alloc] init];
        
        [self.kvo addObserver:self forKeyPath:@"isStarted" options:NSKeyValueObservingOptionOld context:nil];
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

- (IBAction)speakIt:(id)sender {
    NSString *s = [[NSString alloc]init];
    self.kvo.isStarted = YES;
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

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        //
        
    }
    
    
    
}


@end
