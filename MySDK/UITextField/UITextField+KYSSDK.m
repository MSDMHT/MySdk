//
//  UITextField+SDK.m
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import "UITextField+KYSSDK.h"

@implementation UITextField (KYSSDK)

- (void)setPlaceholder:(NSString *)placeholder placeholderFont:(UIFont *)placeholderFont placeholderColor:(UIColor *)placeholderColor
{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName :  placeholderColor, NSFontAttributeName : placeholderFont}];
}

@end
