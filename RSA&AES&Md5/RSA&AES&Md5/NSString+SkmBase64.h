//
//  NSString+SkmBase64.h
//  RSA&AES&Md5
//
//  Created by shikaiming on 2020/4/14.
//  Copyright © 2020 shikaiming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SkmBase64)

// 对一个字符串进行base64编码,并且返回
-(NSString *)base64EncodeString:(NSString *)string;

// 对base64编码之后的字符串解码,并且返回
-(NSString *)base64DecodeString:(NSString *)string;
@end


/**
 终端命令行
 编码：base64 123.png -o 123.txt
 解码：base64 123.txt -o test.png -D //是-D还是-d看具体的操作系统
 
 */
NS_ASSUME_NONNULL_END
