//
//  NSString+SkmBase64.m
//  RSA&AES&Md5
//
//  Created by shikaiming on 2020/4/14.
//  Copyright © 2020 shikaiming. All rights reserved.
//

#import "NSString+SkmBase64.h"


@implementation NSString (SkmBase64)

// 对一个字符串进行base64编码,并且返回
-(NSString *)base64EncodeString:(NSString *)string {
    // 1.先转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 2.对二进制数据进行base64编码,完成之后返回字符串
    return [data base64EncodedStringWithOptions:0];
}

// 对base64编码之后的字符串解码,并且返回
-(NSString *)base64DecodeString:(NSString *)string {
    // 注意:该字符串是base64编码后的字符串
    // 1.转换为二进制数据(完成了解码的过程)
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];

    // 2.把二进制数据在转换为字符串
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
