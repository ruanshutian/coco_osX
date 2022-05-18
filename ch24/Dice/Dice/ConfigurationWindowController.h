//
//  ConfigurationWindowController.h
//  Dice
//
//  Created by Aron Ruan on 2022/5/17.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface DieConfiguration : NSObject 
@property(nonatomic)NSColor*color;
@property(nonatomic)NSInteger rolls;

@end

@interface ConfigurationWindowController : NSWindowController
{
    NSColor *_color;
    NSInteger _rolls ;
};
- (instancetype)init:(NSColor*)color :(NSInteger)rolls;

@property(nonatomic)DieConfiguration *configuration;

//-(void)setColor:(NSColor*)newValue;
//-(void)setRolls:(NSInteger)newValue;
//-(NSColor*)getColor;
//-(NSInteger)getRolls;

@end

NS_ASSUME_NONNULL_END
