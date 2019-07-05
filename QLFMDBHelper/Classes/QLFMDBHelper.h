//
//  QLSqliteHelper.h
//  QLSqliterHelper
//
//  Created by Paramita on 2019/6/25.
//

#import <Foundation/Foundation.h>

#import <QLEncryptFMDatabaseQueue.h>

@interface QLFMDBHelper : NSObject

@property (nonatomic, copy) NSString * dbPath;
@property (nonatomic, retain) FMDatabaseQueue *dbQueue;

+ (instancetype)dbHelper;
/// adapt to pre version
+ (instancetype)sqliterHelper;

- (instancetype)createWithDBPath:(NSString *)dbPath encryptKey:(NSString *)enKey;

- (void)createTables;

- (BOOL)openDB;
- (BOOL)existsRecordsInTable:(NSString *)tableName;

//! 判断是否存在表
- (BOOL) isTableOK:(NSString *)tableName;
@end

