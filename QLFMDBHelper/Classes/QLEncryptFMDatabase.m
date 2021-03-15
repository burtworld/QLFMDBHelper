//
//  QLEncryptFMDatabase.m
//  QLSqliterHelper
//
//  Created by Paramita on 2019/6/25.
//

#import "QLEncryptFMDatabase.h"

static NSString * _encryptKey;

@implementation QLEncryptFMDatabase
{
    
}

+ (void)initialize {
    _encryptKey = @"QLEncryptFMDatabase";
}

+ (void)setEncryptKey:(NSString *)encryptKey {
    _encryptKey = encryptKey;
}

+ (NSString *)getEncryptKey {
    return _encryptKey;
}

+ (id)databaseWithPath:(NSString *)inPath encrytKey:(NSString *)encrytKey {
    return [[[self class] alloc] initWithPath:inPath encrytKey:encrytKey];
}

- (id)initWithPath:(NSString *)path encrytKey:(NSString *)encrytKey {
    if (self = [super initWithPath:path]) {
        _encryptKey = encrytKey;
    }
    return self;
}

#pragma mark - 重写父类open方法
- (BOOL)open{
    BOOL res = [super open];
    if (res && _encryptKey) {
        BOOL suc = [self setKey:_encryptKey];
        NSLog(@"FMDB setEncryptKey:%d",suc);
    }else{
        
    }
    return res;
}

- (BOOL)openWithFlags:(int)flags vfs:(NSString *)vfsName{
    BOOL res = [super openWithFlags:flags vfs:vfsName];
    if (res && _encryptKey) {
         BOOL suc = [self setKey:_encryptKey];
        NSLog(@"FMDB setEncryptKey:%d",suc);
    }
    return res;
}


@end
