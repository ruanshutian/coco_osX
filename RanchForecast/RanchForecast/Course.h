//
//  Course.h
//  RanchForecast
//
//  Created by Aron Ruan on 2022/5/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Course : NSObject

@property(nonatomic)NSString*title;
@property(nonatomic)NSURL*url;
@property(nonatomic)NSDate*nextStartDate;


@end

NS_ASSUME_NONNULL_END
