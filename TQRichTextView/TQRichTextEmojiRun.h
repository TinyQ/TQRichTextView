//
//  TQRichTextEmojiRun.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-21.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextBaseRun.h"
#import "TQRichTextImageRun.h"

@interface TQRichTextEmojiRun : TQRichTextImageRun

+ (NSString *)analyzeText:(NSString *)string runsArray:(NSMutableArray **)runArray;

@end
