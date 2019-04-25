//
//  UIFont+SDK.h
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (KYSSDK)

/**
 正常字体

 @param size 字体大小
 @return UIFont
 */
+ (UIFont *)normalFontOfSize:(CGFloat)size;

/**
 自定义字体

 @param size 字体大小
 @return UIFont
 */
+ (UIFont *)customFontOfSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
