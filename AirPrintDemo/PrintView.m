//
//  PrintView.m
//  AirPrintDemo
//
//  Created by zhoubaoyang on 15/11/3.
//  Copyright © 2015年 zhoubaoyang. All rights reserved.
//

#import "PrintView.h"
#import "Model.h"
@implementation PrintView


-(instancetype)initWithFrame:(CGRect)frame Model:(Model*)model{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage* codeImage = [self createBarImageWithOrderStr:model.orderstr];
        //  通过订单号获取订单的条形码
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = model.nameStr;
        nameLabel.font = [UIFont systemFontOfSize:100];
        nameLabel.frame =CGRectMake(0, 60, 1727, 100);
        nameLabel.textAlignment = 1;
        [self addSubview:nameLabel];
        
        UILabel *dateLabel = [[UILabel alloc] init];
        dateLabel.text = model.numberStr;
        dateLabel.font = [UIFont fontWithName:@"arial" size:111*2];
        dateLabel.frame = CGRectMake(0, 200, 1727, 300);
        dateLabel.textAlignment = 1;
        [self addSubview:dateLabel];
        
        UIImageView *codeImageView = [[UIImageView alloc] init];
        codeImageView.image = codeImage;
        codeImageView.frame = CGRectMake(216, 500, 1290, 288);
        [self addSubview:codeImageView];
        
        UILabel *codeNumLabel = [[UILabel alloc] init];
        NSString *str1 = [model.orderstr substringWithRange:NSMakeRange(0, 3)];
        NSString *str2 = [model.orderstr substringWithRange:NSMakeRange(3, 3)];
        NSString *str3 = [model.orderstr substringWithRange:NSMakeRange(6, 3)];
        NSString *str4 = [model.orderstr substringWithRange:NSMakeRange(9, 3)];
        codeNumLabel.text = [NSString stringWithFormat:@"%@   %@   %@   %@", str1, str2, str3, str4];
        codeNumLabel.font = [UIFont fontWithName:@"arial" size:134];
        codeNumLabel.frame = CGRectMake(216, 800, 1290, 159);
        [self addSubview:codeNumLabel];
        
        UILabel *strLabel = [[UILabel alloc] init];
        strLabel.text = @"包裹號，請帖在對應的包裹上";
        strLabel.font = [UIFont systemFontOfSize:58];
        strLabel.frame = CGRectMake(0, 980, 1727, 69);
        strLabel.textAlignment = 1;
        [self addSubview:strLabel];
    }
    return self;
}

#pragma mark - 获取条形码
-(UIImage*)createBarImageWithOrderStr:(NSString*)str{
    // 创建条形码
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    // 恢复滤镜的默认属性
    [filter setDefaults];
    // 将字符串转换成NSData
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    // 通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    // 获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    // 将CIImage转换成UIImage，并放大显示
    UIImage* image =  [UIImage imageWithCIImage:outputImage scale:0 orientation:UIImageOrientationUp];
    return image;
}

@end
