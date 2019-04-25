//
//  UIButton+SDK.m
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import "UIButton+KYSSDK.h"

@implementation UIButton (KYSSDK)

+ (instancetype)buttonWithType:(UIButtonType)type
                   normalTitle:(NSString *)title
                 textAlignment:(NSTextAlignment)alignment
                          font:(CGFloat)fontSize
                    titleColor:(UIColor *)titleColor
               backGroundColor:(UIColor *)backGroundColor
{
    UIButton *button = [self buttonWithType:type];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.textAlignment = alignment;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.backgroundColor = backGroundColor;
    [button sizeToFit];
    
    return button;
}

@end
