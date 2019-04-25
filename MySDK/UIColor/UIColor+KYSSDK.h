//
//  UIColor+SDK.h
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (KYSSDK)

/**
 根据rgb来设置颜色(默认alpha为1)

 @param rgb 0x000000 (16进制)
 @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSInteger)rgb;

+ (UIColor *)colorWithRGB:(NSInteger)rgb Alpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
