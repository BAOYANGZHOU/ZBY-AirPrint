//
//  PrintManager.m
//  AirPrintDemo
//
//  Created by zhoubaoyang on 15/11/3.
//  Copyright © 2015年 zhoubaoyang. All rights reserved.
//

#import "PrintManager.h"
@implementation PrintManager
+(void)printImageWithArr:(NSArray*)imageArr ViewController:(UIViewController<UIPrintInteractionControllerDelegate>*)viewController ShowRect:(CGRect)showRect{
    
    NSMutableArray* printItems = [NSMutableArray arrayWithCapacity:0];
    for (UIImage* image in imageArr) {
        NSData* imageData = UIImagePNGRepresentation(image);
        // 得到打印数据
        [printItems addObject:imageData];
    }
    
    UIPrintInteractionController *printController = [UIPrintInteractionController sharedPrintController];
    
    if(printController && [UIPrintInteractionController canPrintData: printItems[0]] ) {
        printController.delegate = viewController;
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = @"ZBY";
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        printController.printInfo = printInfo;
        printController.showsPageRange = NO;
        printController.printingItems = printItems;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
            if (completed)
            {
                // 执行成功后的处理
                
            }
            else if (!completed && error)
            {
                // 执行失败后的处理
            }
        };
        
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            [printController presentAnimated:YES completionHandler:completionHandler];
            // iPhone使用这个方法
        }
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            [printController presentFromRect:showRect inView:viewController.view animated:YES completionHandler:completionHandler];
            // iPad使用这个方法
        }
        
    }
    
}
@end
