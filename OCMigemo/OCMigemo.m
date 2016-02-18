//
//  OCMigemo.m
//  OCMigemo
//
//
//

#import "OCMigemo.h"

#include "migemo.h"

@interface OCMigemo() {
  migemo* migemoObject;
}
@property(nonatomic, strong) NSString* dictPath;
@property(nonatomic, readonly) NSString* defaultMigemoDictPath;
@end

@implementation OCMigemo

static NSString* kOCMigemoErrorDomain = @"so.lai.ocmigemo.error";
static NSString* kOCMigemoDefaultMigemoDirname = @"dict";
static NSString* kOCMigemoDefaultMigemoDictFilename = @"migemo-dict";

- (id)initWithDictPath:(NSString *)path
{
  self = [super init];
  if(self){
    _dictPath = path;
  }
  return self;
}

- (void)dealloc
{
  if (migemoObject) {
    migemo_close(migemoObject);
  }
}

- (NSString *)paternWithString:(NSString *)keyword
{
  return [self paternWithString:keyword error:nil];
}

- (NSString *)paternWithString:(NSString *)keyword error:(NSError **)error
{
  if (!migemoObject) {
    NSString* path = [self userMigemoDictPath] ?: self.defaultMigemoDictPath;
    migemoObject = migemo_open([path UTF8String]);
  }
  
  if(!migemo_is_enable(migemoObject)){
    *error = [NSError errorWithDomain:kOCMigemoErrorDomain
                                 code:-999
                             userInfo:@{NSLocalizedFailureReasonErrorKey: NSLocalizedStringFromTable(@"Couldn't open migemo dict.", kOCMigemoErrorDomain, nil)}];
  }
  const unsigned char* result = migemo_query(migemoObject, (const unsigned char*)keyword.UTF8String);
  return [NSString stringWithCString:(const char*)result encoding:NSShiftJISStringEncoding];
}

- (NSRange)rangeOfSearch:(NSString *)keyword from:(NSString *)text
{
  NSString* patern = [self paternWithString:keyword];
  return [text rangeOfString:patern options:NSRegularExpressionSearch];
}

#pragma mark - Private

- (NSString *)defaultMigemoDictPath
{
  NSString* path = [[NSBundle mainBundle] pathForResource:@"OCMigemo.bundle" ofType:nil];
  return [[NSBundle bundleWithPath:path] pathForResource:kOCMigemoDefaultMigemoDictFilename ofType:nil];
}

- (NSString *)userMigemoDictPath
{
  NSString* path = [self.dictPath stringByAppendingPathComponent:kOCMigemoDefaultMigemoDictFilename];
  if(![[NSFileManager defaultManager] isReadableFileAtPath:path]){
    return nil;
  }
  
  return path;
}

@end
