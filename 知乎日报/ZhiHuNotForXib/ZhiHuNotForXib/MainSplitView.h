//
//  MainSplitView.h
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/29.
//

#import <Cocoa/Cocoa.h>
#import "LeftView.h"
#import "RightView.h"
#import "ZHTableView.h"

#import "EntireStories.h"
#import "Stories.h"

#import "YYModel/YYModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainSplitView : NSSplitView<NSTableViewDataSource, NSTableViewDelegate>

@property(nonatomic ) LeftView*leftView;
@property(nonatomic ) RightView*rightView;

@property (nonatomic) NSMutableArray<Stories*>*stories;

@property (nonatomic) ZHTableView *tableView;
@property(nonatomic)NSTableView*zhTableView;
//@property (weak) IBOutlet ZHCustomCellView *tableView;

@property(nonatomic)NSURLSession *session;

@property(nonatomic)WKWebView*webView;

@end

NS_ASSUME_NONNULL_END
