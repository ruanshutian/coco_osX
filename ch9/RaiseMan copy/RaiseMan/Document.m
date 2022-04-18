//
//  Document.m
//  RaiseMan
//
//  Created by Aron Ruan on 2022/4/4.
//

#import "Document.h"
#import "Employe.h"
@interface Document ()

@end

@implementation Document

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
}

-(NSNibName)windowNibName
{
    return  @"Document";
}
-(instancetype)init
{
    self=[super init];
    if(self)
    {
//        [self.employees setName:NULL];
//        [self.employees setRaise:NULL];
//        NSLog(@"%@",self.employees);
    }
    return self;
}



@end
