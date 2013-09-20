//
//  TQRichTextEmojiRun.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-21.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextEmojiRun.h"

@implementation TQRichTextEmojiRun

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
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

@end
