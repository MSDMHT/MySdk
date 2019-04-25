//
//  Marco.h
//  SDKLib
//
//  Created by MemoryFate on 2018/12/27.
//  Copyright © 2018 MemoryFate. All rights reserved.
//

#ifndef Marco_h
#define Marco_h

// 客户端App版本号
#define kAppVersion                   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 操作系统版本号
#define kCurrentSystemVersion            [[UIDevice currentDevice] systemVersion]

// system size
#define kScreenBounds                    ([UIScreen mainScreen].bounds)
#define kScreenHeight                    ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth                     ([UIScreen mainScreen].bounds.size.width)
#define kStatusBarHeight                 [UIApplication sharedApplication].statusBarFrame.size.height
#define kTabBarHeight                    (kScreenIsIPhoneX ? 83.f : 49.f)
// frame按照比例布局
#define kAutoValue(value) (float)value / 375 * kScreenWidth

// iPhone X
#define kScreenIsIPhoneX                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kScreenSafeBottomHeight          (kScreenIsIPhoneX ? 34.f : 0.0)


// DEBUG日志
#ifdef DEBUG
#define Log(s,...) NSLog(@"<%@:(%d)>\n  %s\n  %@\n\n", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __func__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define Log(s,...)
#endif

#endif /* Marco_h */
