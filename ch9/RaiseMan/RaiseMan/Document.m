//
//  Document.m
//  RaiseMan
//
//  Created by Aron Ruan on 2022/4/6.
//

#import "Document.h"
#import "Employee.h"
@interface Document ()

@end

@implementation Document

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    
    Employee *employees=[[Employee alloc]init];
    NSLog(@"%@   %d",employees.name,employees.raise);
    _employees.name=@"rrrrr";
    _employees.raise=1.01;
    NSLog(@"%f",_employees.raise);
//    [employees setName:@"1111"];
//    [employees setRaise:0.02];
}
-(NSNibName)windowNibName
{
    return @"Document";
}

//-(instancetype)init
//{
//    self=[super init];
//    if(self)
//    {
////        [self.employees setName:@"rrr"];
//        
//    }
//    return  self;
//}


//-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
//{
//    NSString* voice=_voices[row];
//
//    NSString *voiceName = [self voiceNameForIdentifier:voice];
//    return voiceName;
//}



@end
