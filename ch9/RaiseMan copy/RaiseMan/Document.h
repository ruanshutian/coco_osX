//
//  Document.h
//  RaiseMan
//
//  Created by Aron Ruan on 2022/4/4.
//

#import <Cocoa/Cocoa.h>
#import "Employe.h"
#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Document : NSWindowController

@property(nonatomic,strong)Employe *employees;

//
//@property(weak)IBOutlet NSTextField *textField;
//@property(weak)IBOutlet NSButton *addEmployee;
//@property(weak)IBOutlet NSButton *remove;

//@property(weak)IBOutlet NSTableView *tableview;

@end

NS_ASSUME_NONNULL_END
