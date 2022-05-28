//
//  Document.h
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/6.
//

#import <Cocoa/Cocoa.h>
#import "Employee.h"

@interface Document : NSDocument<NSWindowDelegate>
//{
//    NSInteger KVOContext;
//}

@property(nonatomic,weak)IBOutlet NSTableView*tableView;
@property(nonatomic,weak)IBOutlet NSArrayController*arrayController;
@property(nonatomic,strong)IBOutlet NSButton *remove;

//@property(nonatomic)NSWindowController*windowControllers;

@property(nonatomic,strong) NSMutableArray <Employee *> *employees;

@property(nonatomic)NSUndoManager* undo;
@property(nonatomic)NSInteger KVOContext;

@property(nonatomic)NSObject*oldValue;

//@property(nonatomic)NSPropertyListFormat outputFormat;

-(void)startObservingEmployee:(Employee*)employee;
-(void)stopObservingEmployee:(Employee*)employee;

@end

