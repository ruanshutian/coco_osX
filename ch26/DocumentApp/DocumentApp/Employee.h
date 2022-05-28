//
//  Employee.h
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/6.
//

//#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject<NSCoding>

@property(nonatomic,strong)NSString *name;
@property(nonatomic)CGFloat raise;

//-(NSComparisonResult)compareWithOthers:(Employee *)stu;

@end

NS_ASSUME_NONNULL_END
