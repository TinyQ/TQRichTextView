//
//  TQRichTextBaseRun.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-21.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextBaseRun.h"

@implementation TQRichTextBaseRun

- (id)init
{
    self = [super init];
    if (self) {
        self.isResponseTouch = NO;
    }
    return self;
}

//-- 替换基础文本
- (void)replaceTextWithAttributedString:(NSMutableAttributedString*) attributedString
{
    [attributedString addAttribute:@"TQRichTextAttribute" value:self range:self.range];
}

//-- 绘制内容
- (BOOL)drawRunWithRect:(CGRect)rect
{
    return NO;
}

@end
