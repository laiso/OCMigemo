//
//  OCMigemo.h
//  OCMigemo
//
//

#import <Foundation/Foundation.h>

@interface OCMigemo : NSObject
- (id)initWithDictPath:(NSString *)path;

- (NSString *)paternWithString:(NSString *)keyword;
- (NSString *)paternWithString:(NSString *)keyword error:(NSError **)error;

- (NSRange)rangeOfSearch:(NSString *)keyword from:(NSString *)text;
@end
