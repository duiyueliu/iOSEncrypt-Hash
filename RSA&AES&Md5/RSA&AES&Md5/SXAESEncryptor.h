//
//  SXAESEncryptor.h
//  RSA&AES&Md5
//
//  Created by shikaiming on 2020/4/13.
//  Copyright © 2020 shikaiming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXAESEncryptor : NSObject

// 普通AES加、解密
+(NSData *)AES256ParmEncryptWithKey:(NSString *)key Encrypttext:(NSData *)text;   //加密
+(NSData *)AES256ParmDecryptWithKey:(NSString *)key Decrypttext:(NSData *)text;   //解密
+(NSString *) aes256_encrypt:(NSString *)key Encrypttext:(NSString *)text;
+(NSString *) aes256_decrypt:(NSString *)key Decrypttext:(NSString *)text;

// 追加base64方式加密
+ (NSString *)encryptAES:(NSString *)content key:(NSString *)key;

// 追加base64方式解密
+ (NSDictionary *)decryptAES:(NSString *)content key:(NSString *)key;

@end
