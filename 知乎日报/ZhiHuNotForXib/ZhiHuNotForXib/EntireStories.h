//
//  EntireStories.h
//  ZhiHu
//
//  Created by Aron Ruan on 2022/5/26.
//

#import <Foundation/Foundation.h>
#import "Stories.h"
NS_ASSUME_NONNULL_BEGIN

@interface EntireStories : NSObject
@property (nonatomic,copy) NSString *date;
@property(nonatomic,copy)NSMutableArray<Stories *> *stories;
@property(nonatomic)NSArray<Stories *> *top_stories;

@end

NS_ASSUME_NONNULL_END
