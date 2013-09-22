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

+ (NSString *)analyzeText:(NSString *)string runsArray:(NSMutableArray **)array
{
    for (int i = 0; i < string.length; i++)
    {
        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
        if ([s isEqualToString:@"＋"])
        {
            NSRange range = NSMakeRange(i, 1);
            string = [string stringByReplacingCharactersInRange:range withString:@" "];
            
            TQRichTextEmojiRun *emoji = [[TQRichTextEmojiRun alloc] init];
            emoji.range = range;
            emoji.originalText = @"＋";
            [*array addObject:emoji];
        }
    }
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"http?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    NSMutableArray *arrayOfURLs = [[NSMutableArray alloc] init];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"Extracted URL: %@",substringForMatch);
        
        [arrayOfURLs addObject:substringForMatch];
    }
    
    return [string copy];
}

@end
