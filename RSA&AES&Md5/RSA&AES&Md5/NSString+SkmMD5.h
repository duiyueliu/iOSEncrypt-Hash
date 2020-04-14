//
//  NSString+SkmMD5.h
//  RSA&AES&Md5
//
//  Created by shikaiming on 2020/4/14.
//  Copyright © 2020 shikaiming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SkmMD5)

#pragma mark - md5散列

/**
*  默认是32位小写的16进制
*  MD5加密, 32位 小写
*  @return 返回散列后的字符串
*/
- (NSString *)md5String;
/**
*  MD5加密, 32位 小写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForLower32Bate;

/**
*  MD5加密, 32位 大写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForUpper32Bate;

/**
*  MD5加密, 16位 小写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForLower16Bate;
/**
*  MD5加密, 16位 大写
*  @return 返回散列后的字符串
*/
- (NSString *)md5StringForUpper16Bate;



#pragma mark - HMACMD5散列方法
- (NSString *)hmacMD5StringWithKey:(NSString *)key;
    
- (NSString *)shar1;

- (NSString *)shar1ForUpper;

- (NSString *)shar256;

- (NSString *)shar256ForUpper;

- (NSString *)shar512;

- (NSString *)shar512ForUpper;

@end

/** mac终端查看md5
    md5+空格 + 文件名 +回车
 
 */

NS_ASSUME_NONNULL_END
