//
//  MainViewController.m
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/30.
//
#import "MainSplitView.h"
#import "MainWindowController.h"
#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic) MainSplitView*mainSplitView;
//@property (nonatomic) MainWindowController*mainWindowController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    NSLog(@"viewDidLoad");
//    [self.view.window setFrame:NSMakeRect(0, 0, 1000, 1000) display:YES];
    
    NSTableView*tableView = [[NSTableView alloc] initWithFrame:NSMakeRect(100, 100, 100, 100)];
    tableView.backgroundColor = [NSColor blueColor];
    
//    [self creatSplitView];
    
    
}

-(void)creatSplitView
{
    self.mainSplitView = [[MainSplitView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.mainSplitView];
    
    NSLog(@"mainSplitView");
}
- (NSNibName)nibName
{
    return @"MainViewController";
}



@end
