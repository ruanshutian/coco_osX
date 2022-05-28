//
//  Document.m
//  DocumentApp
//
//  Created by Aron Ruan on 2022/4/6.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        
        self.displayName = @"Raise Man";
        _employees = [[NSMutableArray alloc]init];
        Employee *em1 = [[Employee alloc]init];
        [_employees addObject:em1];
        
        Employee *em2 = [[Employee alloc]init];
        em2.name=@"abcaa";
        em2.raise=0.1;
        [_employees addObject:em2];
        
        em1.name=@"zz";
        em1.raise=0.01;
        [_employees addObject:em1];
        
        NSLog(@"%@",_employees);
    }
    return self;
}

//+ (BOOL)autosavesInPlace {
//    return YES;
//}

//- (NSMutableArray <Employee *> *)employees {
//    if (!_employees) {
//        _employees = [NSMutableArray array];
//    }
//
//    return _employees;
//}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return nil.
    // Alternatively, you could remove this method and override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}



- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return NO.
    // Alternatively, you could remove this method and override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you do, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
//    return FALSE;
}
//-(NSMutableArray<Employee *> *)employees
//{
//    Employee *em1=[[Employee alloc]init];
//    NSMutableArray <Employee*>*em=[[NSMutableArray alloc]init];
//    [em addObject:em1];
////    [em addObject:em1];
//    NSLog(@"%@",em);
//    return em;
//}
//-(void)addEmployeesObject:(Employee *)object
//{
//    Employee *em1=[[Employee alloc]init];
//    em1.name=@"rst";
//    em1.raise=0.01;
//    [_employees addObject:em1];
//    NSLog(@"%@",_employees[0].name);
//}

//-(void)insertObject:(Employee *)object inEmployeesAtIndex:(id)index
//{
//        Employee *em1=[[Employee alloc]init];
//        em1.name=@"rst";
//        em1.raise=0.01;
//        [_employees addObject:em1];
//        NSLog(@"%@",_employees[0].name);
//}

//-(NSMutableArray<Employee *> *)employees
//{
//    NSMutableArray <Employee*> *em;
//    
//    Employee *em1=[[Employee alloc]init];
//    [em1 setName:@"rst"];
//    em1.raise=0.01;
//    [em addObject:em1];
//    NSLog(@"%@",em[0].name);
//    
//    return em;
//}


@end
