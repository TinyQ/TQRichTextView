//
//  TQRichTextRunEmoji.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-17.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextRunEmoji.h"
#import <CoreText/CoreText.h>

@implementation TQRichTextRunEmoji

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

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
    //
    NSMutableAttributedString *imageAttributedString = [[NSMutableAttributedString alloc] initWithString:@" "];
    //
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&emojiCallbacks, (__bridge void*)self);
    [imageAttributedString addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)runDelegate range:NSMakeRange(0, self.range.length)];
    CFRelease(runDelegate);
    //
    [imageAttributedString addAttribute:@"TQRichTextAttribute" value:self range:NSMakeRange(0, self.range.length)];
    
    [attString insertAttributedString:imageAttributedString atIndex:self.range.location];
}

- (void)drawRunWithRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIImage *image = [UIImage imageNamed:@"cry.png"];
    if (image)
    {
        CGContextDrawImage(context, rect, image.CGImage);
    }
}

#pragma mark - RunDelegateCallback
void TQRichTextRunEmojiDelegateDeallocCallback(void *refCon)
{
    
}

//--上行高度
CGFloat TQRichTextRunEmojiDelegateGetAscentCallback(void *refCon)
{
    TQRichTextRunEmoji *run =(__bridge TQRichTextRunEmoji *) refCon;
    return run.originalFont.ascender * 1.2;
}

//--下行高度
CGFloat TQRichTextRunEmojiDelegateGetDescentCallback(void *refCon)
{
    TQRichTextRunEmoji *run =(__bridge TQRichTextRunEmoji *) refCon;
    return run.originalFont.descender * 1.2;
}

//-- 宽
CGFloat TQRichTextRunEmojiDelegateGetWidthCallback(void *refCon)
{
    TQRichTextRunEmoji *run =(__bridge TQRichTextRunEmoji *) refCon;
    //return run.originalFont.pointSize;
    return (run.originalFont.ascender - run.originalFont.descender) * 1.2;
}

@end
