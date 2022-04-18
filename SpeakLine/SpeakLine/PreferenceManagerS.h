//
//  PreferenceManagerS.h
//  SpeakLine
//
//  Created by Aron Ruan on 2022/4/12.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface PreferenceManagerS : NSWindowController<NSSpeechSynthesizerDelegate>
{
    NSUserDefaults *_userDefaults;
    NSString *_activeVoiceKey;
    NSString *_activeTextKey;
};
//@property(nonatomic)NSUserDefaults *userDefaults;
//@property(nonatomic)NSString *activeVoiceKey;
//@property(nonatomic)NSString *activeTextKey;

-(void)registerDefaultPreferences;

-(void)setActiveVoiceKeyXXX:(NSString *)setActiveVoiceKeyXXX;
-(NSString *)activeVoiceKeyXXX;
-(void)setActiveTextKey:(NSString *)activeTextKey;
-(NSString *)activeTextKey;

@end

NS_ASSUME_NONNULL_END
