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
@property(nonatomic)        float               lineSpacing;     // default is 1.5 行间距

//-- 特殊的文本数组。在绘制的时候绘制
@property(nonatomic,readonly)       NSMutableArray *richTextRunsArray;
//-- 特熟文本的绘图边界字典。用来做点击处理定位
@property(nonatomic,readonly)       NSMutableDictionary *richTextRunRectDic;
//-- 原文本通过解析后的文本
@property(nonatomic,readonly,copy)  NSString        *textAnalyzed;

@property(nonatomic,weak) id<TQRichTextViewDelegate> delegage;

@end
