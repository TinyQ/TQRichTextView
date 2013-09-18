//
//  TQRichTextView.h
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-12.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TQRichTextView : UIView

@property(nonatomic,copy)   NSString           *text;            // default is nil
@property(nonatomic,strong) UIFont             *font;            // default is nil (system font 17 plain)
@property(nonatomic,strong) UIColor            *textColor;       // default is nil (text draws black)

@property(nonatomic,readonly)       NSMutableArray  *richTextRunsArray;
@property(nonatomic,readonly,copy)  NSString        *textAnalyzed;


@end
