//
//  LeftView.h
//  ZhiHuNotForXib
//
//  Created by Aron Ruan on 2022/5/30.
//

#import <Cocoa/Cocoa.h>
#import "ZHTableView.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LeftView : NSView<NSTableViewDataSource, NSTableViewDelegate>
@property(nonatomic)NSTableView*tableView;
@property(nonatomic)ZHTableView*zhTableView;
@property (nonatomic) NSMutableArray<NSString*>*stories;
@property(nonatomic)WKWebView*webView;

@property(nonatomic)NSScrollView*scrollView;
@end

NS_ASSUME_NONNULL_END
