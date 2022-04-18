//
//  Document.h
//  RaiseMan
//
//  Created by Aron Ruan on 2022/4/6.
//

#import <Cocoa/Cocoa.h>
#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Document : NSWindowController

@property(nonatomic,strong) NSMutableArray <Employee *> *employees;

@property(weak)IBOutlet NSTableView *tableview;

@end

NS_ASSUME_NONNULL_END
