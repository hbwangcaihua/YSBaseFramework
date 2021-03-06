//
//  NSDictionary+YSRemove.m
//  YSFramework
//
//  Created by caihua.wang on 2017/12/4.
//  Copyright © 2017年 wch. All rights reserved.
//

#import "NSDictionary+YSRemove.h"

@implementation NSDictionary (YSRemove)

/**
 *  移除不可用的key，序列化时使用。如:value为block
 */
+(NSDictionary *)removeUnabelKey:(NSDictionary *)dic{
    
    /* 遍历字典中的值 */
    if ([dic isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        
        for (NSString *key in [mutableDic allKeys]) {
            id obj = [mutableDic objectForKey:key];
            
            if ([obj isKindOfClass:[NSString class]] ||
                [obj isKindOfClass:[NSArray class]] ||
                [obj isKindOfClass:[NSURL class]] ||
                [obj isKindOfClass:[NSNumber class]]) {
                
            }
            /* 如果内部还是字典，递归调用 */
            else if ([obj isKindOfClass:[NSDictionary class]]) {
                [mutableDic setObject:[self removeUnabelKey:obj] forKey:key];
            } else {
                [mutableDic removeObjectForKey:key];
            }
        }
        
        return mutableDic;
    }
    else {
        return dic;
    }
}

/**
 *  移除值为null的key,存储数据时使用
 */
+ (id) removeJsonNullFromDic:(id)obj {
    // obj类型是字典类型
    if ([obj isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary *mutableDic = [(NSMutableDictionary *)obj mutableCopy];
        
        for (NSString *key in [mutableDic allKeys]) {
            
            id object = [mutableDic objectForKey:key]; //通过遍历所有的key值，获取到每一个value
            if ([object isKindOfClass:[NSNull class]]) {
                
                [mutableDic removeObjectForKey:key]; //删除值类型为NSNull的值
                
            } else if ([object isKindOfClass:[NSArray class]]) {
                
                NSArray *arr = (NSArray *)object;
                object = [self removeJsonNullFromDic:arr]; // 如果类型为数组类型，然后调用递归，判断自己下面的类型是否还有字典类型，直到最底层为NSString或NSNull
                [mutableDic setObject:object forKey:key]; //将这个key位置的字典元素置换成删除<null>后的
                
            } else if ([object isKindOfClass:[NSDictionary class]]) {
                
                NSDictionary *dic = (NSDictionary *)object;
                object = [self removeJsonNullFromDic:dic]; //如果类型还是为字典类型，调用递归继续判断
                [mutableDic setObject:object forKey:key]; //将这个key位置的字典元素置换成删除<null>后的
                
            }
        }
        return [mutableDic copy];
        
    } else if ([obj isKindOfClass:[NSArray class]]) { // obj类型是数组类型
        
        NSMutableArray *mutableArr = [(NSMutableArray *)obj mutableCopy];
        for (int i = 0; i<[mutableArr count]; i++) {
            
            NSDictionary *dict = [obj objectAtIndex:i];
            dict = [self removeJsonNullFromDic:dict];
            [mutableArr replaceObjectAtIndex:i withObject:dict];// 将去掉<null>键值对的字典换掉原来的数组元素
            
        }
        return [mutableArr copy];
    }
    return obj;
}

@end
