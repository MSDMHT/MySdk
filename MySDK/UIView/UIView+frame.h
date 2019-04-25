//
//  UIView+frame.h
//  SDKLib_Example
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (frame)
// x y
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

// width height
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

// center
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

// margin
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@end

NS_ASSUME_NONNULL_END
