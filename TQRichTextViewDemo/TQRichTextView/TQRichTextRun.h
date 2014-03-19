//
//  TQRichTextRun.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 2/27/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface TQRichTextRun : UIResponder

/**
 *  文本单元内容
 */
@property (nonatomic,copy  ) NSString *text;

/**
 *  文本单元字体
 */
@property (nonatomic,strong) UIFont   *font;

/**
 *  文本单元在字符串中的位置
 */
@property (nonatomic,assign) NSRange  range;

/**
 *  是否自己绘制自己
 */
@property(nonatomic,getter = isDrawSelf) BOOL drawSelf;

/**
 *  向字符串中添加相关Run类型属性
 */
- (void)decorateToAttributedString:(NSMutableAttributedString *)attributedString range:(NSRange)range;

/**
 *  绘制Run内容
 */
- (void)drawRunWithRect:(CGRect)rect;

@end

extern NSString * const kTQRichTextRunSelfAttributedName;