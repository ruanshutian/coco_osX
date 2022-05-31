//
//  Stories.h
//  ZhiHu
//
//  Created by Aron Ruan on 2022/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stories : NSObject
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *ga_prefix;
@property (nonatomic,copy) NSString *hint;
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *image_hue;
@property (nonatomic,copy) NSArray<NSString *> *images;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *type;
@end

NS_ASSUME_NONNULL_END
