#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "QLEncryptFMDatabase.h"
#import "QLEncryptFMDatabaseQueue.h"
#import "QLFMDBHelper.h"

FOUNDATION_EXPORT double QLFMDBHelperVersionNumber;
FOUNDATION_EXPORT const unsigned char QLFMDBHelperVersionString[];

