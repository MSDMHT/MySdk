//
//  UIView+SDK.h
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KYSSDK)

/**
 设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)

 @param color 起始颜色
 @param endColor 结束颜色
 @param startPoint 开始点
 @param endPoint 结束点
 */
-(void)setGradientBackgroundColorWithStartColor:(UIColor *)color EndColor:(UIColor *)endColor StartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
