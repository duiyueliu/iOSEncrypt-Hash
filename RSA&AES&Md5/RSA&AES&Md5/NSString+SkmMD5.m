//
//  NSString+SkmMD5.m
//  RSA&AES&Md5
//
//  Created by shikaiming on 2020/4/14.
//  Copyright © 2020 shikaiming. All rights reserved.
//

#import "NSString+SkmMD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (SkmMD5)

/**
*  默认是32位小写的16进制
*  MD5加密, 32位 小写
*  @return 返回散列后的字符串
*/
- (NSString *)md5String{
       const char *str = self.UTF8String;
       uint8_t buffer[CC_MD5_DIGEST_LENGTH];
       CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
       return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH isUpper:NO];
}

/**
*  MD5加密, 32位 小写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForLower32Bate{
    
    return self.md5String;
}

/**
*  MD5加密, 32位 大写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForUpper32Bate{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH isUpper:YES];
}

/**
*  MD5加密, 16位 小写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForLower16Bate{
    
    //16位实际上是从32位字符串中，取中间的第 9 位到第 24 位的部分，所以在iOS中就是NSMakeRange(8, 16)。
    NSString *md5Str = [self md5StringForLower32Bate];
    return [md5Str substringWithRange:NSMakeRange(8, 16)];
}
/**
*  MD5加密, 16位 大写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForUpper16Bate{
    
    //16位实际上是从32位字符串中，取中间的第 9 位到第 24 位的部分，所以在iOS中就是NSMakeRange(8, 16)。
    NSString *md5Str = [self md5StringForUpper32Bate];
    return [md5Str substringWithRange:NSMakeRange(8, 16)];
}

#pragma mark - HMACMD5散列方法
- (NSString *)hmacMD5StringWithKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH isUpper:NO];
}

/**
 *  返回二进制 Bytes 流的字符串表示形式
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *  @param isUpper 是否是大写
 *  @return 字符串表示形式
 */
- (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length isUpper:(BOOL)isUpper{
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        if (isUpper) {
            [strM appendFormat:@"%02X", bytes[i]];
        }else{
            [strM appendFormat:@"%02x", bytes[i]];
        }
        
    }
    return [strM copy];
}

- (NSString *)shar1{
    const char *str = self.UTF8String;
       uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
       CC_SHA1(str, (CC_LONG)strlen(str) , buffer);
       return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH isUpper:NO];
}

- (NSString *)shar1ForUpper{
        const char *str = self.UTF8String;
           uint8_t buffer[CC_SHA1_DIGEST_LENGTH];
           CC_SHA256(str, (CC_LONG)strlen(str) , buffer);
           return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH isUpper:YES];
}

- (NSString *)shar256{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG)strlen(str) , buffer);
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH isUpper:NO];
}

- (NSString *)shar256ForUpper{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG)strlen(str) , buffer);
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH isUpper:YES];
}

- (NSString *)shar512{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(str, (CC_LONG)strlen(str) , buffer);
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH isUpper:NO];
}

- (NSString *)shar512ForUpper{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(str, (CC_LONG)strlen(str) , buffer);
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH isUpper:YES];
}


@end
