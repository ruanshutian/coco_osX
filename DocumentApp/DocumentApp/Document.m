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
        _KVOContext=0;
//        _undo=[[[Document alloc]init] undoManager];
//        NSLog(@"_undo is defined  ");
//        for(Employee* employee in _employees)
//        {
//            [self stopObservingEmployee:employee];
//        }

        
        self.displayName = @"Raise Man";
        _employees = [[NSMutableArray alloc]init];
        Employee *em1 = [[Employee alloc]init];
        [_employees addObject:em1];
        
        Employee *em2 = [[Employee alloc]init];
        em2.name=@"aaa";
        em2.raise=5;
        [_employees addObject:em2];
        Employee *em3 = [[Employee alloc]init];
        em3.name=@"aaaaaa";
        em3.raise=1;
        [_employees addObject:em3];
        
        NSLog(@"%@",_employees);
    }
    return self;
}


+ (BOOL)autosavesInPlace {
    return YES;
}

// MARK: - Accessors
-(void)insertObject:(Employee *)employee inEmployeesAtIndex:(NSInteger)index
{
    NSLog(@"adding \(employee) to the employees array");
//    NSUndoManager *undoManager=[[NSUndoManager alloc]init];
//    _undo=undoManager;
//    Document *doc=[[Document alloc]init] un];
//    _undo=doc.undoManager;
    NSUndoManager *undo= self.undoManager;
    if (!undo) {
        return;
    }
    
    [[undo prepareWithInvocationTarget:self] removeObjectFromEmployeesAtIndex:[_employees count]];
    if(!undo.undoing)
    {
        [undo setActionName:@"Add Person"];
    }
    [_employees addObject:employee];
    
}

-(void)removeObjectFromEmployeesAtIndex:(NSUInteger)index
{
    Employee* employee=_employees[index];
    NSLog(@"removing \(employee) from the employees array");
//    NSUndoManager *undoManager=[[NSUndoManager alloc]init];
//    _undo=undoManager;
    NSUndoManager *undo= self.undoManager;
    if (!undo) {
        return;
    }

    [[undo prepareWithInvocationTarget:self] insertObject:employee inEmployeesAtIndex:index];
    if(!undo)
    {
        [undo setActionName:@"Remove Person"];
    }
    [_employees removeObjectAtIndex:index];
}

// MARK: - Key Value Observing”
-(void)startObservingEmployee:(Employee*)employee
{
    [employee addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld context:&_KVOContext];

    [employee addObserver:self forKeyPath:@"raise" options:NSKeyValueObservingOptionOld context:&_KVOContext];

}

-(void)stopObservingEmployee:(Employee*)employee
{
    [employee removeObserver:self forKeyPath:@"name" context:&_KVOContext];

    [employee removeObserver:self forKeyPath:@"rasie" context:&_KVOContext];

}

-(void)setEmployees:(NSMutableArray<Employee *> *)employees
{
    if (_employees == employees) {
        return;
    }
    _employees=employees;
    for(Employee* employee in _employees)
    {
        [self startObservingEmployee:employee];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    BOOL f=(context==&_KVOContext);
    if(!f)
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    _oldValue=[[NSObject alloc]init];
    _oldValue=change[NSKeyValueChangeOldKey];

    if(_oldValue == [NSNull null])
    {
        _oldValue=nil;
    }

    [[_undo prepareWithInvocationTarget:object] setValue:_oldValue forKeyPath:keyPath];

}

-(void)windowWillClose:(NSNotification *)notification
{
        if (!_employees) {
            _employees = [NSMutableArray array];
        }
}
- (IBAction)addEmployee:(id)sender {
    
    NSWindowController*windowController=[[NSWindowController alloc]init];
    windowController=self.windowControllers[0];
    
    NSWindow*window=windowController.window;
    
//    NSWindow* window = [windowControllers[0] window];

    BOOL endedEditing =[window makeFirstResponder:window];

    if(!endedEditing)
    {
        NSLog(@"Unable to end editing.");
        return;
    }
    NSUndoManager *undo=self.undoManager;
    if(undo.groupingLevel>0)
    {
        [undo endUndoGrouping];
        [undo beginUndoGrouping];
    }

    Employee*employee = [_arrayController newObject];

    [_arrayController addObject:employee];

    [_arrayController rearrangeObjects];

//    NSMutableArray<Employee*>* sortedEmployees=[_arrayController arrangedObjects];
    NSMutableArray<Employee*>* sortedEmployees = _arrayController.arrangedObjects;

    NSInteger row =[sortedEmployees count]-1;
//    [sortedEmployees addObject:employee];
//    [sortedEmployees addObjectsFromArray:employee];

    NSLog(@"starting edit of \(employee) in row \(row)");

    [_tableView editColumn:0 row:row withEvent:nil select:true];


}

//-(void)windowControllerDidLoadNib:(NSWindowController *)windowController
//{
//    [super windowControllerDidLoadNib:windowController];
//}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

//- (BOOL)readFromURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError * _Nullable *)outError {
////    NSData *data = [NSData dataWithContentsOfFile:url];
////
////    return [self readFromData:data ofType:typeName error:outError];
//    return YES;
//}

//- (BOOL)readFromFileWrapper:(NSFileWrapper *)fileWrapper ofType:(NSString *)typeName error:(NSError * _Nullable *)outError {
//    return YES;
//}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return nil.
    // Alternatively, you could remove this method and override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    NSLog(@"dataOfType");
    if([_tableView window])
    {
        [[_tableView window] endEditingFor:nil];
    }
    
//    return nil;
//    return [NSKeyedArchiver archivedDataWithRootObject:_employees requiringSecureCoding:YES error:nil];
//    return [NSKeyedArchiver archivedDataWithRootObject:_employees ];
//    return [NSKeyedArchiver archivedDataWithRootObject:_employees requiringSecureCoding:NO error:outError];
    
        //安装目录
        //NSString *docPath = [[NSBundle mainBundle] bundlePath];
        //沙盒home目录
        NSString *docPath = NSHomeDirectory();
        NSLog(@"docPath=%@",docPath);
        
        //完整的文件路径
//        NSString *path = [docPath stringByAppendingPathComponent:@"Documents/numbers.plist"];
//
//        //获取文件夹路径
//        NSString *directory = [path stringByDeletingLastPathComponent];
//
//        if (![[NSFileManager defaultManager] isWritableFileAtPath:directory]) {
//            NSLog(@"目录无写入权限");
//        }
        
//        NSArray *numbers = @[@"one",@"two"];
        //将数据归档到path文件路径里面
//        BOOL success = [NSKeyedArchiver archivedDataWithRootObject:_employees requiringSecureCoding:NO error:outError];
//        
//        if (success) {
//            NSLog(@"归档成功");
//        }else {
//            NSLog(@"归档失败");
//        }
    
        //沙盒ducument目录
//        NSString *docPath2 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//        //完整的文件路径
//        NSString *path2 = [docPath2 stringByAppendingPathComponent:@"personDict.archive"];
//    NSLog(@"path2 = %@",path2);
        //将path文件路径的数据解档出来
//        NSDictionary *personDict = [NSKeyedUnarchiver unarchivedObjectOfClass:[_employees class] fromData:path2 error:outError];
//    NSDictionary *personDict = [NSKeyedUnarchiver unarchivedObjectOfClasses:<#(nonnull NSSet<Class> *)#> fromData:<#(nonnull NSData *)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>];
//        NSLog(@"personDict=%@",personDict);
    
    
    
    return [NSKeyedArchiver archivedDataWithRootObject:_employees requiringSecureCoding:NO error:outError];
}



- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return NO.
    // Alternatively, you could remove this method and override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you do, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
//    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    NSLog(@"About to read data of type \(typeName).");
//    _employees=[NSKeyedUnarchiver unarchivedObjectOfClass: fromData:data error:outError];
//    _employees = [NSKeyedUnarchiver unarchivedObjectOfClass:[Employee class] fromData:data error:outError];
    if (!_employees) {
        _employees = [NSMutableArray array];
    }
//    _employees = [NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:[NSMutableArray<Employee *> class] fromData:data error:outError];
    _employees = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSMutableArray<Employee *> class] fromData:data error:outError];
//    _employees = [NSKeyedUnarchiver unarchivedObjectOfClass:[Employee class] fromData:data error:outError];
//    _employees = [NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:[NSMutableArray<Employee *> class] objectsOfClass:[Employee class] fromData:data error:outError];
    
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
