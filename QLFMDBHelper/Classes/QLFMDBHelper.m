//
//  QLSqliteHelper.m
//  QLSqliterHelper
//
//  Created by Paramita on 2019/6/25.
//

#import "QLFMDBHelper.h"
#if FMDB_SQLITE_STANDALONE
#import <sqlite3/sqlite3.h>
#else
#import <sqlite3.h>
#endif


@implementation QLFMDBHelper

+ (instancetype)dbHelper {
    static id sqliterHelp = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sqliterHelp = [[[self class] alloc] init];
    });
    return sqliterHelp;
}

+ (instancetype)sqliterHelper {
    static id sqliterHelp = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sqliterHelp = [[[self class] alloc] init];
    });
    return sqliterHelp;
}

- (instancetype)createWithDBPath:(NSString *)dbPath encryptKey:(NSString *)enKey {
    self.dbPath = dbPath;
    if (enKey.length) {
        [QLEncryptFMDatabase setEncryptKey:enKey];
        _dbQueue = [QLEncryptFMDatabaseQueue databaseQueueWithPath:self.dbPath];
    }else{
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
    }
    [self createTables];
    return self;
}


- (void)createTables {
        [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
            BOOL suc = [db executeUpdate:@"create table if not exists t_test(uuid text, sm4Key text)"];
            if (suc) {
                NSLog(@"suc---");
            }
        }];
}

- (BOOL)openDB {
//        if (![db open]) {
    //        NSLog(@"open db failed.");
    //        return NO;
    //    }
    
    return YES;
}
// 判断是否存在表
- (BOOL) isTableOK:(NSString *)tableName
{
    __block BOOL ok = NO;
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
        while ([rs next])
        {
            NSInteger count = [rs intForColumn:@"count"];
            if (0 == count) {
                ok = NO;
            }else{
                ok = YES;
            }
        }
        [rs close];
    }];
    return ok;
}
- (BOOL)existsRecordsInTable:(NSString *)tableName {
    //    [self openDB];
    __block BOOL hasRecords = NO;
    if ([self isTableOK:tableName]) {
        [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
            NSString *sql = [NSString stringWithFormat:@"select 1 from %@", tableName];
            FMResultSet *rs = [db executeQuery:sql];
            if (rs.next) {
                hasRecords = YES;
            }
            [rs close];
        }];
    }
    return hasRecords;
}

- (void)exportEncryptDBPath:(NSString *)enPath plainDBPath:(NSString *)plainPath {
    
    const char *sql = [[NSString stringWithFormat:@"PRAGMA key = '%@';", [QLEncryptFMDatabase getEncryptKey]] UTF8String];
    const char *attachSql = [[NSString stringWithFormat:@"ATTACH DATABASE '%@' AS plaintext KEY '';", plainPath] UTF8String];
    const char *exportSql = [[NSString stringWithFormat:@"SELECT sqlcipher_export('plaintext');"] UTF8String];
    const char *detachSql = [[NSString stringWithFormat:@"DETACH DATABASE plaintext;"] UTF8String];

    sqlite3*encrypted_DB =NULL;

    if(sqlite3_open([enPath UTF8String], &encrypted_DB) ==SQLITE_OK)
    {
        int rc;
        char *errmsg = NULL;
        rc = sqlite3_exec(encrypted_DB, sql,NULL,NULL, &errmsg);
        rc =sqlite3_exec(encrypted_DB, attachSql,NULL,NULL, &errmsg);
        rc =sqlite3_exec(encrypted_DB, exportSql,NULL,NULL, &errmsg);
        rc =sqlite3_exec(encrypted_DB, detachSql,NULL,NULL, &errmsg);
        sqlite3_close(encrypted_DB);

    }
    else
    {
        sqlite3_close(encrypted_DB);
        NSAssert1(NO,@"Failed to open database with message '%s'.", sqlite3_errmsg(encrypted_DB));
    }
}
@end
