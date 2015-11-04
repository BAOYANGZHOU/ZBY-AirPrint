//
//  PrintManager.h
//  AirPrintDemo
//
//  Created by zhoubaoyang on 15/11/3.
//  Copyright © 2015年 zhoubaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PrintManager : NSObject
/**
 *  打印一组图片
 *
 *  @param imageArr         存放图片的数组
 *  @param viewController   执行打印操作的控制器，遵从打印协议
 *  @param showRect         打印弹窗显示的区域，此参数只在iPad上使用。
 *
 */
+(void)printImageWithArr:(NSArray*)imageArr ViewController:(UIViewController<UIPrintInteractionControllerDelegate>*)viewController ShowRect:(CGRect)showRect;
@end
