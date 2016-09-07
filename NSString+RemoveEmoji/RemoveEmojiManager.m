//
//  RemoveEmojiManager.m
//  GamesirWorld
//
//  Created by tangbl on 16/9/5.
//  Copyright © 2016年 tangbl. All rights reserved.
//

#import "RemoveEmojiManager.h"

#import "NSString+RemoveEmoji.h"

@interface RemoveEmojiManager ()<UITextViewDelegate>

@end

@implementation RemoveEmojiManager

- (NSArray *)emojies {
    if (!_emojies) {
        NSURL *plist = [[NSBundle mainBundle] URLForResource:@"emoji" withExtension:@"plist"];
        _emojies = [NSArray arrayWithContentsOfURL:plist];
    }
    return _emojies;
}

+ (instancetype)sharedInstance {
    static RemoveEmojiManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RemoveEmojiManager alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark Monitor
- (void)monitorInputView:(UIView *)inputView {

    if ([inputView isKindOfClass:[UITextField class]]) {
        UITextField *textField = (UITextField *)inputView;
        [textField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    if ([inputView isKindOfClass:[UITextView class]]) {
        
        UITextView *textView = (UITextView *)inputView;
        textView.delegate = self;
        
        UIViewController *controller = TDKGetUIViewControllerWith(textView);
        if ([controller respondsToSelector:@selector(textViewDidBeginEditing:)]) {
            [[NSNotificationCenter defaultCenter] addObserver:controller selector:@selector(textViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
        }
    }
}

#pragma mark UITextField Target Action
- (void)textFieldDidChanged:(UITextField *)textField {
    if (textField.text.isIncludingEmoji) {
        textField.text = [textField.text stringByRemovingEmoji];
    }
}

#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.isIncludingEmoji) {
        textView.text = [textView.text stringByRemovingEmoji];
    }
}

@end
