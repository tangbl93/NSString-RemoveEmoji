#import <Foundation/Foundation.h>
#import "RemoveEmojiManager.h"

@interface NSString (RemoveEmoji)

- (BOOL)isIncludingEmoji;

- (instancetype)stringByRemovingEmoji;

- (instancetype)removedEmojiString __attribute__((deprecated));

@end
