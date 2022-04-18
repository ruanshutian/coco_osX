//
//  SourceEditorCommand.m
//  XTComment
//
//  Created by Aron Ruan on 2022/4/14.
//

#import "SourceEditorCommand.h"

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
    NSMutableArray *lineIndexs=[[NSMutableArray alloc]init];
//    NSInteger lineIndexs[10];
    
    NSMutableArray<XCSourceTextRange *> *s = invocation.buffer.selections;
    
    for(XCSourceTextRange *range in s)
    {
        XCSourceTextPosition start = range.start;
        XCSourceTextPosition end = range.end;
        
//        NSLog(@"start = %d , end = %d",start,end);
        for(NSInteger i=start.line;i<=end.line;i++)
        {
            [lineIndexs addObject:[NSNumber numberWithInteger:i]];
            NSMutableString *commentLine = [[NSMutableString alloc]init];
            [commentLine insertString:@"//" atIndex:0];
            [invocation.buffer.lines replaceObjectAtIndex:i withObject:commentLine];
        }

    }
//    NSLog(@"lineIndexs = %@",lineIndexs);
//
//    for(NSNumber* lineNumber in lineIndexs)
//    {
//        NSMutableString *commentLine=[[NSMutableString alloc]init];
//        [commentLine insertString:@"//" atIndex:0];
////        [commentLine insertValue:lineNumber inPropertyWithKey:@"//"];
////        [invocation.buffer.lines insertObject:commentLine atIndex:lineNumber];
//        NSLog(@"lineNumber = %@",lineNumber);
//        NSInteger lineNumberInt=[lineNumber integerValue];
//        [invocation.buffer.lines replaceObjectAtIndex:lineNumberInt withObject:commentLine];
//    }
    
    completionHandler(nil);
}



@end
