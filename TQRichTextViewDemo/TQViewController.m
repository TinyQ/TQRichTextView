//
//  TQViewController.m
//  TQRichTextViewDemo
//
//  Created by fuqiang on 13-9-12.
//  Copyright (c) 2013年 fuqiang. All rights reserved.
//

#import "TQViewController.h"
#import "TQRichTextView.h"

@interface TQViewController ()

@end

@implementation TQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TQRichTextView *richTextView = [[TQRichTextView alloc] initWithFrame:CGRectMake(0, 22, 320, 320)];
    richTextView.text = @"＋一＋二三四＋＋五bounding＋box协议是＋一种具体形<title>1Q84 BOOsK1</title>式的接口或协议是一种＋具体形式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的式的接口或协议是＋一种具体形式的接口＋＋或＋协议是一种具体形式的接的式的式的式的式的式的的式的式<title>1Q84 BOOK1</title>的式的式的式的的式的式<title>1Q84 BOOsK1</title>的式的式的式<div>haha</div>的的式的式的(21)式的式的式http://www.baidu.com/ 的的式的式的式的式的式的的式的式的式的式的式的http://www.baidu.com的式的式的式的式的式的的式的式的式的式的式的的式的式的式的式的式的口或＋协议是一种＋具体形式的接口或协议＋是一种具体形式的＋接口或口或协议是一种具体形式的接[lala]口或协议是一 1234a56789 种具体的接口或bounding bounding bounding bounding nding口或＋协议是一接口或协议＋是一口或＋协议是一体形式的接[哈哈]h";
    richTextView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:richTextView];
    
}

@end
