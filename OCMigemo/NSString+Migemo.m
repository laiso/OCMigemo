//
//  NSString+Migemo.m
//  OCMigemo
//
//
//

#import "NSString+Migemo.h"

#import "OCMigemo.h"

@implementation NSString (Migemo)

- (NSRange)rangeOfMigemoSearch:(NSString *)keyword
{
  OCMigemo* migemo = [OCMigemo new];
  NSString* patern = [migemo paternWithString:keyword];
  return [self rangeOfString:patern options:NSRegularExpressionSearch];
}

@end
