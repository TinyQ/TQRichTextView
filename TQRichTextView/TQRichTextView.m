//
//  TQRichTextView.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-12.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQRichTextView.h"
#import <CoreText/CoreText.h>
#import "TQRichTextRunEmoji.h"

@implementation TQRichTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _text = @"";
        _font = [UIFont systemFontOfSize:12.0];
        _textColor = [UIColor blackColor];
        //
        _richTextRunsArray = [[NSMutableArray alloc] init];
        _textAnalyzed = [self analyzeText:_text];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //
    CGRect viewRect = self.bounds;
    int textLength  = self.textAnalyzed.length;
    NSString *drawText  = self.textAnalyzed;
    
    //绘图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //修正坐标系    
    CGAffineTransform textTran = CGAffineTransformIdentity;
    textTran = CGAffineTransformMakeTranslation(0.0, viewRect.size.height);
    textTran = CGAffineTransformScale(textTran, 1.0, -1.0);
    CGContextConcatCTM(context, textTran);

    //要绘制的文本
    NSMutableAttributedString* attString = [[NSMutableAttributedString alloc] initWithString:drawText];
    
    //换行模式
    CTLineBreakMode lineBreakMode = kCTLineBreakByCharWrapping;
    //对齐方式
    CTTextAlignment alignment = kCTLeftTextAlignment;
    //行间距
    float lineSpacing = 1.0;
    CTParagraphStyleSetting paraStyles[3] =
    {
        {.spec = kCTParagraphStyleSpecifierLineBreakMode,.valueSize = sizeof(CTLineBreakMode),.value = (const void*)&lineBreakMode},
        
        {.spec = kCTParagraphStyleSpecifierAlignment,.valueSize = sizeof(CTTextAlignment),.value = (const void*)&alignment},
        
        {.spec = kCTParagraphStyleSpecifierLineSpacing,.valueSize = sizeof(CGFloat),.value = (const void*)&lineSpacing},
    };
    //设置段落样式
    CTParagraphStyleRef style = CTParagraphStyleCreate(paraStyles,3);
    [attString addAttribute:(NSString*)(kCTParagraphStyleAttributeName) value:(__bridge id)style range:NSMakeRange(0,textLength)];
    CFRelease(style);
    
    //设置字体
    CTFontRef aFont = CTFontCreateWithName((__bridge CFStringRef)self.font.fontName, self.font.pointSize, NULL);
    [attString addAttribute:(NSString*)kCTFontAttributeName value:(__bridge id)aFont range:NSMakeRange(0,textLength)];
    CFRelease(aFont);
    
    //设置颜色
    [attString addAttribute:(NSString *)kCTForegroundColorAttributeName value:(id)self.textColor.CGColor range:NSMakeRange(0,textLength)];
    
    //文本处理
    for (TQRichTextRunBase *textRun in self.richTextRunsArray)
    {
        [textRun replaceTextWithAttributedString:attString];
    }
    
    //绘制

    //设置行高
    float lineHeight = self.font.ascender - self.font.descender;
    //是否绘制
    BOOL drawFlag = YES;
    //行数
    int lineCount = 0;
    //绘制计数
    CFIndex currentIndex = 0;
    
    CTTypesetterRef typeSetter = CTTypesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attString);
    
    float x = 0;
    float y = self.bounds.origin.y + self.bounds.size.height - self.font.ascender;
    
    while(drawFlag)
    {
        CFIndex lineLength = CTTypesetterSuggestLineBreak(typeSetter,currentIndex,self.bounds.size.width);
        check:;
        CFRange lineRange = CFRangeMake(currentIndex,lineLength);
        CTLineRef line = CTTypesetterCreateLine(typeSetter,lineRange);
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        
        //边界检查
        CTRunRef lastRun = CFArrayGetValueAtIndex(runs, CFArrayGetCount(runs) - 1);
        CGFloat lastRunAscent;
        CGFloat laseRunDescent;
        CGFloat lastRunWidth  = CTRunGetTypographicBounds(lastRun, CFRangeMake(0,0), &lastRunAscent, &laseRunDescent, NULL);
        CGFloat lastRunPointX = x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(lastRun).location, NULL);
        
        if ((lastRunWidth + lastRunPointX) > self.bounds.size.width)
        {
            lineLength--;
            goto check;
        }
        
        //--
        x = CTLineGetPenOffsetForFlush(line,0,self.bounds.size.width);
        
        CGContextSetTextPosition(context,x,y);
        
        CTLineDraw(line,context);
        
        //绘制run
        for (int j = 0; j < CFArrayGetCount(runs); j++)
        {
            
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            
            CGFloat runAscent;
            CGFloat runDescent;
            
            NSDictionary* attributes = (__bridge NSDictionary*)CTRunGetAttributes(run);
            
            CGFloat runWidth  = CTRunGetTypographicBounds(run, CFRangeMake(0,0), &runAscent, &runDescent, NULL);
            CGFloat runHeight = runAscent + runDescent;
            CGFloat runPointX = x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            CGFloat runPointY = y - runDescent;
            
            CGRect runRect = CGRectMake(runPointX, runPointY, runWidth, runHeight);
            
            TQRichTextRunBase *textRun = [attributes objectForKey:@"TQRichTextAttribute"];
            
            [textRun drawRunWithRect:runRect];
        }
        
        CFRelease(line);
        
        if(currentIndex + lineLength >= textLength)
        {
            drawFlag = NO;
        }

        lineCount++;
        
        y -= lineHeight + lineSpacing;
        
        currentIndex += lineLength;
    }
    
    CFRelease(typeSetter);
}

#pragma mark - Set
- (void)setText:(NSString *)text
{
    _text = text;
    _textAnalyzed = [self analyzeText:_text];
}

#pragma mark - analyzeText
//-- 解析文本内容
- (NSString *)analyzeText:(NSString *)string
{
    for (int i = 0; i < string.length; i++)
    {
        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
        if ([s isEqualToString:@"＋"])
        {
            NSRange range = NSMakeRange(i, 1);
            string = [string stringByReplacingCharactersInRange:range withString:@" "];
            
            TQRichTextRunEmoji *emoji = [[TQRichTextRunEmoji alloc] init];
            emoji.range = range;
            emoji.originalText = @"+";
            emoji.originalFont = self.font;
            [self.richTextRunsArray addObject:emoji];
        }
    }
    
    return [string copy]; 
}


@end
