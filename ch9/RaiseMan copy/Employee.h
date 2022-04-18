//
//  Employee.h
//  RaiseMan
//
//  Created by Aron Ruan on 2022/4/4.
//

//#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic)CGFloat raise;

@end

NS_ASSUME_NONNULL_END
