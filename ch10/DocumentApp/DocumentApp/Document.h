//
//  Document.h
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/6.
//

#import <Cocoa/Cocoa.h>
#import "Employee.h"

@interface Document : NSDocument

@property(nonatomic,strong) NSMutableArray <Employee *> *employees;

//@property(nonatomic)IBOutlet NSArrayController *arrayController;

@end

