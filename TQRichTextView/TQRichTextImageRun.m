//
//  TQRichTextImageRun.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-21.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextImageRun.h"
#import <CoreText/CoreText.h>

static const float kZoom = 1.1f;

@implementation TQRichTextImageRun

- (void)replaceTextWithAttributedString:(NSMutableAttributedString*) attString
{
    //删除替换的占位字符
    [attString deleteCharactersInRange:self.range];
    
    CTRunDelegateCallbacks emojiCallbacks;
    emojiCallbacks.version      = kCTRunDelegateVersion1;
    emojiCallbacks.dealloc      = TQRichTextRunEmojiDelegateDeallocCallback;
    emojiCallbacks.getAscent    = TQRichTextRunEmojiDelegateGetAscentCallback;
    emojiCallbacks.getDescent   = TQRichTextRunEmojiDelegateGetDescentCallback;
    emojiCallbacks.getWidth     = TQRichTextRunEmojiDelegateGetWidthCallback;

    NSMutableAttributedString *imageAttributedString = [[NSMutableAttributedString alloc] initWithString:@" "];
    
    //
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&emojiCallbacks, (__bridge void*)self);
    [imageAttributedString addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)runDelegate range:NSMakeRange(0, 1)];
    CFRelease(runDelegate);
    
    [attString insertAttributedString:imageAttributedString atIndex:self.range.location];
    
    [super replaceTextWithAttributedString:attString];
}

#pragma mark - RunDelegateCallback

void TQRichTextRunEmojiDelegateDeallocCallback(void *refCon)
{

}

//--上行高度
CGFloat TQRichTextRunEmojiDelegateGetAscentCallback(void *refCon)
{
    TQRichTextImageRun *run =(__bridge TQRichTextImageRun *) refCon;
    return run.originalFont.ascender * kZoom;
}

//--下行高度
CGFloat TQRichTextRunEmojiDelegateGetDescentCallback(void *refCon)
{
    TQRichTextImageRun *run =(__bridge TQRichTextImageRun *) refCon;
    return run.originalFont.descender * kZoom;
}

//-- 宽
CGFloat TQRichTextRunEmojiDelegateGetWidthCallback(void *refCon)
{
    TQRichTextImageRun *run =(__bridge TQRichTextImageRun *) refCon;
    return (run.originalFont.ascender - run.originalFont.descender) * kZoom;
}

@end
