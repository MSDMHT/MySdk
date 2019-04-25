//
//  UIButton+SDK.h
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (KYSSDK)

/**
 快速创建UIButton
 @param type        buttonType
 @param title       buttonTitle
 @param alignment   titleAlign
 @param fontSize    titleSize
 @param titleColor  字体颜色
 @param backGroundColor 背景颜色
 @return            UIButton
 */
+ (instancetype)buttonWithType:(UIButtonType)type
                   normalTitle:(NSString *)title
                 textAlignment:(NSTextAlignment)alignment
                          font:(CGFloat)fontSize
                    titleColor:(UIColor *)titleColor
               backGroundColor:(UIColor *)backGroundColor;

@end

NS_ASSUME_NONNULL_END
