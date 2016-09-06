> Note:运行应该会出错，因为少了这个方法
```
static inline UIViewController * TDKGetUIViewControllerWith(UIView *current) {
    for (UIView *view = current; view; view = view.superview) {
        
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}
```

# NSString+RemoveEmoji

[![CocoaPods](https://img.shields.io/cocoapods/v/NSString+RemoveEmoji.svg?style=flat-square)](https://cocoapods.org/pods/NSString+RemoveEmoji)

A category on NSString that extends for removing Emoji.

## Usage

```objectivec
BOOL isIncludingEmoji = [@"✨Party✨ ✨Hard✨" isIncludingEmoji];
NSString* stringByRemovingEmoji = [@"✨Party✨ ✨Hard✨" stringByRemovingEmoji];
```

## Install

Use CocoaPods.

```ruby
pod 'NSString+RemoveEmoji'
```

## License
Copyright (c) 2014 woxtu

Licensed under the MIT license.
