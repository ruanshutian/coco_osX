//
//  ZHTableView.h
//  ZhiHu
//
//  Created by Aron Ruan on 2022/5/27.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHCustomRowView : NSView

@property (nonatomic, strong) NSImageView *imageView;
@property (nonatomic, strong) NSTextView *textView;

@end


@interface ZHTableView : NSTableView

@property(nonatomic) NSMutableArray  *dataArray;
@property(nonatomic)NSTableCellView*tableCellView;

@property(nonatomic)NSTextField*textField;
@property(nonatomic)NSImageView*imageView;

@end



NS_ASSUME_NONNULL_END
