//
//  UIView+MBView.h
//  MB提示demo
//
//  Created by user on 16/2/19.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MBView)


/**
 *
 *  显示提示框
 *  @param superMBView
 */
+ (void)MBAlertViewShowWith:(UIView *)superMBView;
/**
 *  显示提示框
 *
 *  @param message     文字提醒
 *  @param superMBView
 */
+ (void)MBAlertViewWithMsg:(NSString *)message With:(UIView *)superMBView;
/**
 *  显示提示框
 *
 *  @param message     自定义视图
 *  @param superMBView
 */
+ (void)MBAlertCustomViewWithMsg:(NSString *)message With:(UIView *)superMBView;
/**
 *  显示提示框
 *
 *  @param message     自定义样式
 *  @param superMBView
 */
+ (void)MBAlertCustomStyleWithMsg:(NSString *)message With:(UIView *)superMBView;
/**
 *  隐藏提示框
 *
 *  @param superMBView 隐藏的父视图
 */
+ (void)MBHiddenWith:(UIView *)superMBView;
/**
 *  隐藏全部的提示框
 *
 *  @param superMBView 隐藏的父视图
 */
+ (void)MBHiddenAllWith:(UIView *)superMBView;
@end
