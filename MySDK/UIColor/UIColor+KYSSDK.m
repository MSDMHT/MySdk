//
//  UIColor+SDK.m
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import "UIColor+KYSSDK.h"

@implementation UIColor (KYSSDK)

+ (UIColor *)colorWithRGB:(NSInteger)rgb {
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0];
}
+ (UIColor *)colorWithRGB:(NSInteger)rgb Alpha:(float)alpha {
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:alpha];
}


@end
