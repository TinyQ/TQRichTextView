//
//  TQRichTextView.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-12.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQRichTextBaseRun.h"

@class TQRichTextView;

@protocol TQRichTextViewDelegate<NSObject>

@optional
- (void)richTextView:(TQRichTextView *)view touchBeginRun:(TQRichTextBaseRun *)run;
- (void)richTextView:(TQRichTextView *)view touchEndRun:(TQRichTextBaseRun *)run;

@end

@interface TQRichTextView : UIView

@property(nonatomic,copy)   NSString           *text;            // default is @""
@property(nonatomic,strong) UIFont             *font;            // default is [UIFont systemFontOfSize:12.0]
@property(nonatomic,strong) UIColor            *textColor;       // default is [UIColor blackColor]
@property(nonatomic)        float               lineSpacing;     // default is 1.0 行间距

@property(nonatomic,readonly)       NSMutableArray *richTextRunsArray;
@property(nonatomic,readonly)       NSMutableDictionary *richTextRunRectDic;
@property(nonatomic,readonly,copy)  NSString        *textAnalyzed;
@property(nonatomic,weak) id<TQRichTextViewDelegate> delegage;

@end
