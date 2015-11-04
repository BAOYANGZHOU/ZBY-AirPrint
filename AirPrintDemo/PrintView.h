//
//  PrintView.h
//  AirPrintDemo
//
//  Created by zhoubaoyang on 15/11/3.
//  Copyright © 2015年 zhoubaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@interface PrintView : UIView
/**
 *  初始化方法
 *
 *  @param frame       打印视图所在的位置及大小
 *  @param model       存放数据的模型
 *
 */
-(instancetype)initWithFrame:(CGRect)frame Model:(Model*)model;
@end
