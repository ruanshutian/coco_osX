//
//  PreferenceManagerS.m
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/12.
//

#import "PreferenceManagerS.h"

@interface PreferenceManagerS ()

@end

@implementation PreferenceManagerS

- (void)windowDidLoad {
    [super windowDidLoad];
    
    
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _activeVoiceKey = @"Alex";
        _activeTextKey = @"activeText111";
        _userDefaults = [NSUserDefaults standardUserDefaults];
//        _userDefaults = [[NSUserDefaults alloc]init];
        [_userDefaults synchronize];
        [self registerDefaultPreferences];
    }
    return self;
}

-(void)setActiveVoiceKeyXXX:(NSString *)setActiveVoiceKeyXXX
{
    [_userDefaults setObject:setActiveVoiceKeyXXX forKey:_activeVoiceKey];
//    _activeVoiceKey=activeVoiceKey;
}
-(NSString *)activeVoiceKeyXXX
{
    if(![_userDefaults objectForKey:_activeVoiceKey])
    {
        return @"";
    }
    NSLog(@"[_userDefaults objectForKey:_activeVoiceKey] = %@",[_userDefaults objectForKey:_activeVoiceKey]);
    return [_userDefaults objectForKey:_activeVoiceKey];

}
-(void)setActiveTextKey:(NSString *)activeTextKey
{
    [_userDefaults setObject:activeTextKey forKey:_activeTextKey];
}

-(NSString *)activeTextKey
{
    NSString *text = [_userDefaults objectForKey:_activeTextKey];
    return text;
}

-(void)registerDefaultPreferences
{

    NSDictionary<NSString *,id> *defaults=@{_activeVoiceKey : [NSSpeechSynthesizer defaultVoice],
                                            _activeTextKey : @"Able was I ere I saw Elba."
    };
//    [_activeTextKey valueForKey:[NSSpeechSynthesizer defaultVoice]];
//    [_activeTextKey valueForKey:@"Able was I ere I saw Elba."];
    [self setActiveVoiceKeyXXX:[NSSpeechSynthesizer defaultVoice]];
    [self setActiveTextKey:@"Able was I ere I saw Elba."];
    [_userDefaults registerDefaults:defaults];
    
//    [defaults synchronize];
    NSLog(@"_userDefaults = %@",_userDefaults);
}

@end
