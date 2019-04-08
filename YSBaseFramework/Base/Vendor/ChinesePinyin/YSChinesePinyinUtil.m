//
//  ChineseString.m
//  YUChineseSorting
//
//  Created by yuzhx on 15/4/19.
//  Copyright (c) 2015年 BruceYu. All rights reserved.
//

#import "YSChinesePinyinUtil.h"

@implementation YSChinesePinyinUtil

/**
*  返回排序好的字符拼音
*/
+(NSMutableArray*)ReturnSortChineseArrar:(NSArray*)stringArr
{
    //获取字符串中文字的拼音首字母并与字符串共同存放
    NSMutableArray *chineseStringsArray=[NSMutableArray array];
    for(int i=0;i<[stringArr count];i++)
    {
        YSChinesePinyinUtil *chineseString = [[YSChinesePinyinUtil alloc]init];
        chineseString.string = [NSString stringWithString:[stringArr objectAtIndex:i]];
        if(chineseString.string == nil){
            chineseString.string = @"";
        }
        //去除两端空格和回车
        chineseString.string  = [chineseString.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        
        //此方法存在一些问题 有些字符过滤不了
        //NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
        //chineseString.string = [chineseString.string stringByTrimmingCharactersInSet:set];
        
        
        //这里我自己写了一个递归过滤指定字符串   RemoveSpecialCharacter
        chineseString.string = [YSChinesePinyinUtil RemoveSpecialCharacter:chineseString.string];
        // NSLog(@"string====%@",chineseString.string);
        
        
        //判断首字符是否为字母
        NSString *regex = @"[A-Za-z]+";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        NSString *initialStr = [chineseString.string length]?[chineseString.string substringToIndex:1]:@"";
        if ([predicate evaluateWithObject:initialStr]) {
//            NSLog(@"chineseString.string== %@",chineseString.string);
            //首字母大写
            chineseString.pinYin = [chineseString.string capitalizedString] ;
        }else{
            if(![chineseString.string isEqualToString:@""]){
                NSString *pinYinResult = [NSString string];
                for(int j=0;j<chineseString.string.length;j++){
                    NSString *singlePinyinLetter = [[NSString stringWithFormat:@"%c", pinyinFirstLetter([chineseString.string characterAtIndex:j])]uppercaseString];
//                    NSLog(@"singlePinyinLetter ==%@",singlePinyinLetter);                    
                    pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
                }
                chineseString.pinYin = pinYinResult;
            }else{
                chineseString.pinYin = @"";
            }
        }
        [chineseStringsArray addObject:chineseString];
    }
    //按照拼音首字母对这些Strings进行排序
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    
//    for(int i=0;i<[chineseStringsArray count];i++){
//        NSLog(@"chineseStringsArray====%@",((ChineseString*)[chineseStringsArray objectAtIndex:i]).pinYin);
//    }
//    NSLog(@"-----------------------------");
    return chineseStringsArray;
}



//过滤指定字符串   里面的指定字符根据自己的需要添加 过滤特殊字符
+(NSString*)RemoveSpecialCharacter: (NSString *)str {
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @",.？、 ~￥#&<>《》()[]{}【】^@/￡¤|§¨「」『』￠￢￣~@#&*（）——+|《》$_€"]];
    if (urgentRange.location != NSNotFound)
    {
        return [self RemoveSpecialCharacter:[str stringByReplacingCharactersInRange:urgentRange withString:@""]];
    }
    return str;
}

#pragma mark - 下面是lz-fzj 2016-01-02 加上去的方法
/**
 *  获取汉字的各个字首字母
 *  @param chineseName
 *  @return
 */
+(NSString *)getChineseStringShortName:(NSString *)chineseName{
    NSMutableArray *tmpArray=[self ReturnSortChineseArrar:@[chineseName]];
    if(tmpArray==nil||tmpArray.count==0) return @"";
    return ((YSChinesePinyinUtil *)tmpArray.firstObject).pinYin;
}


/**
 *  获取汉字的全称字母
 *  @param chineseName
 *  @return
 */
+ (NSString *)ysGetChineseStringFullform:(NSString *)chineseName
{
    if ([chineseName length]) {
        NSMutableString *pinyin = [[NSMutableString alloc] initWithString:chineseName];
        CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
        CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripDiacritics, NO);
        pinyin= (NSMutableString *)[pinyin stringByReplacingOccurrencesOfString:@" " withString:@""];
        return [pinyin uppercaseString];
        
    }
    return nil;
}

//获取某个字符串或者汉字的首字母.
+ (NSString *)firstCharactorWithString:(NSString *)string
{
    NSMutableString *str = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef) str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinYin = [str capitalizedString];
    return [pinYin substringToIndex:1];
}

/**
 *  获取汉字简拼
 */
+ (NSString *)ysGetChineseStringShortform:(NSString *)chineseName{
    
    NSMutableString *shorStr = [[NSMutableString alloc] init];
    for(int i=0;i<chineseName.length;i++){
        
        NSString *charStr = [chineseName substringWithRange:NSMakeRange(i, 1)];
        NSString *pinjinStr = [YSChinesePinyinUtil ysGetChineseStringFullform:charStr];
        if(pinjinStr.length>0){
            [shorStr appendString:[pinjinStr substringWithRange:NSMakeRange(0, 1)]];
        }
    }
    
    return shorStr;
}


/**
 *  获取某个字符串或者汉字的首字母.
 */
+ (NSString *)ysGetChineseStringFirstCharform:(NSString *)chineseName{
    NSString *charStr = [chineseName substringWithRange:NSMakeRange(0, 1)];
    NSString *pinjinStr = [YSChinesePinyinUtil ysGetChineseStringFullform:charStr];
    return [pinjinStr substringWithRange:NSMakeRange(0, 1)];
}

/**
 *  判断是否为正常字母
 */
+ (NSString *)ysGetFormatFirstChar:(NSString *)firstChar{
    if(firstChar.length != 1){
        return @"#";
    }
    
    NSString *regex = @"[A-Za-z]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([predicate evaluateWithObject:firstChar]) {
        return firstChar;
    }
    return @"#";
}

@end
