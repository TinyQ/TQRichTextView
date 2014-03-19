//
//  TQRichTextRunURL.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 2/27/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import "TQRichTextRun.h"

@interface TQRichTextRunURL : TQRichTextRun

/**
 *  解析字符串中url内容生成Run对象
 *
 *  @param attributedString 内容
 *
 *  @return TQRichTextRunURL对象数组
 */
+ (NSArray *)runsForAttributedString:(NSMutableAttributedString *)attributedString;

@end
