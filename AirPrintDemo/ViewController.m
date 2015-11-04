//
//  ViewController.m
//  AirPrintDemo
//
//  Created by zhoubaoyang on 15/11/3.
//  Copyright © 2015年 zhoubaoyang. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "PrintView.h"
#import "PrintManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)print:(id)sender {
    
    Model* model1 = [[Model alloc] initWithNameStr:@"张三" numberStr:@"25-41" orderStr:@"RN3456789012"];
    Model* model2 = [[Model alloc] initWithNameStr:@"张四" numberStr:@"25-42" orderStr:@"QQ3456789012"];
    Model* model3 = [[Model alloc] initWithNameStr:@"张五" numberStr:@"25-43" orderStr:@"ET3456789012"];
    
    // 创建打印数据的model
    
    PrintView* printView1 = [[PrintView alloc] initWithFrame:CGRectMake(-1800, 0, 1827, 1120) Model:model1];
    PrintView* printView2 = [[PrintView alloc] initWithFrame:CGRectMake(-1800, 0, 1827, 1120) Model:model2];
    PrintView* printView3 = [[PrintView alloc] initWithFrame:CGRectMake(-1800, 0, 1827, 1120) Model:model3];
    
    // 通过model得到打印所需要的视图
    
    NSArray* printViewArr = @[printView1,printView2,printView3];
    NSMutableArray* printImageArr = [NSMutableArray arrayWithCapacity:0];
    
    for (PrintView* view in printViewArr) {
        [self.view addSubview:view];
        // 将视图添加在控制器上，供截图使用
        UIImage* tempShotImage = [self screenShotImageWithSize:CGSizeMake(1727, 1120) View:view];
        // 得到视图图层的图片，供打印使用
        [view removeFromSuperview];
        // 截图完成后，移除视图
        [printImageArr addObject:tempShotImage];
    }
    
    [PrintManager printImageWithArr:printImageArr ViewController:self ShowRect:CGRectMake(0, 0, 1300, 200)];
    // 打印这组图片
    
}
#pragma mark - 截取视图显示图层，得到打印所需图片
-(UIImage*)screenShotImageWithSize:(CGSize)ImageSize View:(UIView*)contentView{
    UIGraphicsBeginImageContext(ImageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [contentView.layer renderInContext:context];
    //     renderInContext 不安全
    //     drawViewHierarchyInRect 与 renderInContext 功能相同
    //    [contentView drawViewHierarchyInRect:CGRectMake(0, 0, ImageSize.width, ImageSize.height) afterScreenUpdates:YES];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
