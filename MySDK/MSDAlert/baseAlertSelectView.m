//
//  baseAlertSelectView.m
//  DDClient
//
//  Created by mac on 2018/9/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "baseAlertSelectView.h"
@interface baseAlertSelectView ()


@end
@implementation baseAlertSelectView

//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self=[super initWithFrame:frame]) {
//        [self initUI];
//    }
//    return self;
//}

- (void)initUI {
    self.frame = SCREEN_BOUNDS;
    // 背景遮罩图层
    [self addSubview:self.backgroundView];
    // 弹出视图
    [self addSubview:self.alertView];
    // 设置弹出视图子视图
    // 添加顶部标题栏
    [self.alertView addSubview:self.topView];
    // 添加左边取消按钮
    [self.topView addSubview:self.leftBtn];
    // 添加右边确定按钮
    [self.topView addSubview:self.rightBtn];
    // 添加中间标题按钮
    [self.topView addSubview:self.titleLabel];
    [self.topView addSubview:self.minorTitleLable];
    // 添加分割线
    [self.topView addSubview:self.lineView];
    
    [self showWithAnimation:YES];
}

#pragma mark - 背景遮罩图层
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]initWithFrame:SCREEN_BOUNDS];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3f];
        _backgroundView.userInteractionEnabled = YES;
        UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapBackgroundView:)];
        [_backgroundView addGestureRecognizer:myTap];
    }
    return _backgroundView;
}

#pragma mark - 弹出视图
- (UIView *)alertView {
    if (!_alertView) {
        _alertView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - kTopViewHeight - kDatePicHeight, SCREEN_WIDTH, kTopViewHeight + kDatePicHeight+5)];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.layer.cornerRadius=5;
        _alertView.layer.masksToBounds=YES;
    }
    return _alertView;
}

#pragma mark - 顶部标题栏视图
- (UIView *)topView {
    if (!_topView) {
        _topView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kTopViewHeight + 0.5)];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}

#pragma mark - 左边取消按钮
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(5, 17, 60, 28);
        _leftBtn.backgroundColor = [UIColor clearColor];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f * kScaleFit];
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

#pragma mark - 右边确定按钮
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(SCREEN_WIDTH - 65, 17, 60, 28);
        _rightBtn.backgroundColor = [UIColor clearColor];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f * kScaleFit];
        [_rightBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_rightBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

#pragma mark - 中间标题按钮
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 10, SCREEN_WIDTH - 130, kTopViewHeight-30)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text=@"选择用车时间";
        _titleLabel.font = [UIFont systemFontOfSize:15.0f * kScaleFit];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark -  次标题栏

- (UILabel *)minorTitleLable {
    if (!_minorTitleLable) {
        _minorTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(65, kTopViewHeight-25, SCREEN_WIDTH - 130, 20)];
        _minorTitleLable.backgroundColor = [UIColor clearColor];
        _minorTitleLable.font = [UIFont systemFontOfSize:12.0f * kScaleFit];
        _minorTitleLable.textColor = [UIColor blackColor];
        _minorTitleLable.text=@"(起点当地时间)";
        _minorTitleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _minorTitleLable;
}

#pragma mark - 分割线
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, kTopViewHeight, SCREEN_WIDTH, 0.5)];
        _lineView.backgroundColor  = [UIColor colorWithRed:225 / 255.0 green:225 / 255.0 blue:225 / 255.0 alpha:1.0];
        [self.alertView addSubview:_lineView];
    }
    return _lineView;
}

#pragma mark - 点击背景遮罩图层事件
- (void)didTapBackgroundView:(UITapGestureRecognizer *)sender {
     [[NSNotificationCenter defaultCenter] postNotificationName:@"alertDisAppear" object:nil];
    [self dismissWithAnimation:YES];
}

#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"alertDisAppear" object:nil];
     [self dismissWithAnimation:YES];
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn {
    
}

#pragma mark - 关闭视图方法
- (void)dismissWithAnimation:(BOOL)animation {
    // 关闭动画
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = self.alertView.frame;
        rect.origin.y += kDatePicHeight + kTopViewHeight;
        self.alertView.frame = rect;
        
        self.backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation {
    //1. 获取当前应用的主窗口
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    if (animation) {
        // 动画前初始位置
        CGRect rect = self.alertView.frame;
        rect.origin.y = SCREEN_HEIGHT;
        self.alertView.frame = rect;
        
        // 浮现动画
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.alertView.frame;
            rect.origin.y -= kDatePicHeight + kTopViewHeight;
            self.alertView.frame = rect;
        }];
    }
}


- (void)dealloc{
    NSLog(@"===========delloc===");
}


@end
