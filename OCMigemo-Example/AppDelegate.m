//
//  AppDelegate.m
//  OCMigemo-Example
//
//
//

#import "AppDelegate.h"

#import "OCMigemo.h"

@interface AppDelegate()
@property(nonatomic, strong) UITextView* textView;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];
  
  self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, self.window.frame.size.width, self.window.frame.size.height/2)];
  self.textView.editable = NO;
  [self.window addSubview:self.textView];
  
  [self retrieve];
  [self test];
  return YES;
}

- (void)retrieve
{
  OCMigemo* migemo = [OCMigemo new];
  
  NSMutableAttributedString* text = [[NSMutableAttributedString alloc] initWithString:@"庭には二羽ニワトリがいる"];
  NSRange range = [migemo rangeOfSearch:@"hane" from:text.string];
  if(range.location != NSNotFound){
    [text setAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} range:range];
  }
  self.textView.attributedText = text;
}

- (void)test
{
  OCMigemo* migemo = [OCMigemo new];
  
  NSString* text = @"庭には二羽ニワトリがいる";
  NSRange range = [migemo rangeOfSearch:@"hane" from:text];
  if(range.location != NSNotFound){
    NSLog(@"%@ %@", NSStringFromRange(range), [text substringWithRange:range]);
  }
}

@end
