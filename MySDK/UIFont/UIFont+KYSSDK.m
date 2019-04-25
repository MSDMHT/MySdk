//
//  UIFont+SDK.m
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import "UIFont+KYSSDK.h"

@implementation UIFont (KYSSDK)

+ (UIFont *)normalFontOfSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)customFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"SourceHanSansCN-Normal" size:size];
}

@end
