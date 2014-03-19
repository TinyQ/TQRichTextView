//
//  TQRichTextRun.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 2/27/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import "TQRichTextRun.h"

NSString * const kTQRichTextRunSelfAttributedName = @"kTQRichTextRunSelfAttributedName";

@implementation TQRichTextRun

/**
 *  向字符串中添加相关Run类型属性
 */
- (void)decorateToAttributedString:(NSMutableAttributedString *)attributedString range:(NSRange)range
{
    [attributedString addAttribute:kTQRichTextRunSelfAttributedName value:self range:range];
        
    self.font = [attributedString attribute:NSFontAttributeName atIndex:0 longestEffectiveRange:nil inRange:range];
}

/**
 *  绘制Run内容
 */
- (void)drawRunWithRect:(CGRect)rect
{
    
}

@end

