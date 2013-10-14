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
    
    NSString *text = @"[smile]RichTextBox控件允许用户输入和编辑文本的同时提供了[cry]比普通的TextBox控件更高级的格式特征。 RichTextBox控件提供了数个有用的特征[smile]，你可以在控件中安排文本的格式。[smile]要改变文本的格式，[cry]必须先选中该文本。只有选中的文本才可以编排字符和段落的格式。https://github.com额/有了这些属性，就可以设置[cry]文本使用粗体，改变[cry]字体的颜色，创建超底稿和子底稿。[smile]也可以设置左右缩排或不缩排，从而调整段落的格式。 RichTextBox控件可以打开和保存RTF文件或普通的ASCII文本文件。你可以使用控件的方法（LoadFile[smile]SaveFile）直接读和写文件 RichTextBox控件使用集合支https://github.com持嵌入的对象。每个嵌入控件中的对象都表示为一个[1]对象。这允许文档中创建的控件可以包含其他控件或文档。https://github.com/ 例如，可以创建一个包含报表、Microsoft Word文档或任何在系统中注册的其他OLE对象的文档。要在RichTextBox控件中插入对象，可以简单地拖住一个文件（如使用Windows 95的Explorerwww.chiphell.com/或其他应用程序（如Microsoft Word）中所用文件的加亮部分（选择部分），将其直接放到该RichTextBox控件上。http://www.cnblogs.com/CCSSPP/";
    
    CGFloat height = [TQRichTextView getRechTextViewHeightWithText:text viewWidth:320 font:[UIFont systemFontOfSize:12.0] lineSpacing:1.5];
    
    self.richTextView = [[TQRichTextView alloc] initWithFrame:CGRectMake(0, 22, 320, height)];
    self.richTextView.text = text;
    self.richTextView.backgroundColor = [UIColor whiteColor];
    self.richTextView.delegage = self;
    [self.view addSubview:self.richTextView];
    
}

- (void)richTextView:(TQRichTextView *)view touchBeginRun:(TQRichTextBaseRun *)run
{

}

- (void)richTextView:(TQRichTextView *)view touchEndRun:(TQRichTextBaseRun *)run
{
    if (run.type == richTextURLRunType)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:run.originalText]];
    }
}

@end
