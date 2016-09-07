//
//  RemoveEmojiManager.h
//  GamesirWorld
//
//  Created by tangbl on 16/9/5.
//  Copyright © 2016年 tangbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemoveEmojiManager : NSObject

@property(copy, nonatomic) NSArray *emojies;
@property(strong, nonatomic) NSMutableCharacterSet *emojieCharacterSet;

+ (instancetype)sharedInstance;

- (void)monitorInputView:(UIView *)inputView;

@end
