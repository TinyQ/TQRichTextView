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
//-- 属性字符串
@property(nonatomic,readonly)       NSMutableAttributedString *attString;
//-- 文本行数。
@property(nonatomic,readonly)       NSInteger  *lineCount;
//-- delegage
@property(nonatomic,weak) id<TQRichTextViewDelegate> delegage;

//-- 通过字符串计算文本控件的高度
+ (CGFloat)getRechTextViewHeightWithText:(NSString *)text viewWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;

@end
