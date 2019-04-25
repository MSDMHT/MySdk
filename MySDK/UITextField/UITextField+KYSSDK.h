//
//  UITextField+SDK.h
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (KYSSDK)

/**
 快速设置水印

 @param placeholder 水印文字
 @param placeholderFont 水印字体
 @param placeholderColor 水印颜色
 */
- (void)setPlaceholder:(NSString *)placeholder placeholderFont:(UIFont *)placeholderFont placeholderColor:(UIColor *)placeholderColor;

@end

NS_ASSUME_NONNULL_END
