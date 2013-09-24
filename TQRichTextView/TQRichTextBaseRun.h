//
//  TQRichTextBaseRun.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-21.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

typedef enum richTextRunType
{
    richTextURLRunType,
    richTextEmojiRunType,
    
}TQRichTextRunType;

@interface TQRichTextBaseRun : NSObject

//-- 文本单元类型
@property (nonatomic) TQRichTextRunType type;

//-- 原始文本
@property (nonatomic,copy) NSString *originalText;

//-- 原始字体
@property (nonatomic,strong) UIFont *originalFont;

//-- 文本所在位置
@property (nonatomic) NSRange range;

//-- 替换基本文本样式
- (void)replaceTextWithAttributedString:(NSMutableAttributedString*) attributedString;

//-- 绘制内容
- (void)drawRunWithRect:(CGRect)rect;


@end
