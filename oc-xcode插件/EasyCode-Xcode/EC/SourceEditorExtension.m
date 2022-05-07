//
//  SourceEditorExtension.m
//  EC
//
//  Created by Aron Ruan on 2022/4/18.
//

#import "SourceEditorExtension.h"

@implementation SourceEditorExtension

/*
- (void)extensionDidFinishLaunching
{
    // If your extension needs to do any work at launch, implement this optional method.
}
*/


- (NSArray <NSDictionary <XCSourceEditorCommandDefinitionKey, id> *> *)commandDefinitions
{
    // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
    NSArray <NSDictionary <XCSourceEditorCommandDefinitionKey, id> *> * res=@[
        @{XCSourceEditorCommandClassNameKey:@"SourceEditorCommand",
          XCSourceEditorCommandIdentifierKey:@"easycode.insertcode",
          XCSourceEditorCommandNameKey:@"insertcode"
        },
        @{XCSourceEditorCommandClassNameKey:@"SourceEditorCommand",
          XCSourceEditorCommandIdentifierKey:@"easycode.editmapping",
          XCSourceEditorCommandNameKey:@"editmapping"
        }
    ];
    return res;
}
 

@end
