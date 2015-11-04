//
//  Model.m
//  printManagerTest
//
//  Created by zhoubaoyang on 15/10/22.
//  Copyright © 2015年 zhoubaoyang. All rights reserved.
//

#import "Model.h"

@implementation Model
-(instancetype)initWithNameStr:(NSString*)nameStr numberStr:(NSString*)numberStr orderStr:(NSString*)orderStr{
    self = [super init];
    if (self) {
        _nameStr = nameStr;
        _numberStr = numberStr;
        _orderstr = orderStr;
    }
    return self;
}
@end
