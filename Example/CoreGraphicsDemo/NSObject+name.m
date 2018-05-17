//
//  NSObject+name.m
//  XM_Mediator_Example
//
//  Created by zhangxiaomeng on 2018/5/7.
//  Copyright © 2018年 zhangxieomeng1. All rights reserved.
//

#import "NSObject+name.h"
#import <objc/runtime.h>
@implementation NSObject (name)

- (void)setName:(NSString *)name {
    
    // objc_setAssociatedObject（将某个值跟某个对象关联起来，将某个值存储到某个对象中）
    
    // object:给哪个对象添加属性
    
    // key:属性名称
    
    // value:属性值
    
    // policy:保存策略
    
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSString *)name {
    
    return objc_getAssociatedObject(self, @"name");
    
}

+ (void)load{
    
    int count =0;
//    Ivar *ivarList = class_copyIvarList(self, &count);
    Ivar *ivarList = class_copyIvarList(self, &count);

}

@end
