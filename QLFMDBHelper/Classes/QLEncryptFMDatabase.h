//
//  QLEncryptFMDatabase.h
//  QLSqliterHelper
//
//  Created by Paramita on 2019/6/25.
//

#import <fmdb/FMDB.h>


@interface QLEncryptFMDatabase : FMDatabase
+ (void)setEncryptKey:(NSString *)encryptKey;
+ (NSString *)getEncryptKey;
@end

