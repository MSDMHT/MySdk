//
//  UILabel+SDK.h
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (KYSSDK)

/**
 快速实例化一个UILabel
 @param font    字体大小
 @param bColor  背景色
 @param tColor  字体颜色
 @param alignment 文本排列
 @param isWarp  是否换行
 @return        UIlabel
 */
+ (instancetype)initLabelWithFont:(UIFont *)font
                  backGroundColor:(UIColor *)bColor
                        textColor:(UIColor *)tColor
                    textAlignment:(NSTextAlignment)alignment
                           isWarp:(BOOL)isWarp;

/**
 改变行间距

 @param label 目标label
 @param lineSpace 间距大小
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace;
/**
 改变字间距

 @param label 目标label
 @param lineSpace 字间距大小
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace;
+ (void)changeSpaceForLabel:(UILabel *)label lineSpace:(float)lineSpace wordSpace:(float)wordSpace;

@end

NS_ASSUME_NONNULL_END
