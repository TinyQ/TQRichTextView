//
//  TQRichTextURLRun.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-23.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextBaseRun.h"

@interface TQRichTextURLRun : TQRichTextBaseRun

+ (NSString *)analyzeText:(NSString *)string runsArray:(NSMutableArray **)array;

@end
