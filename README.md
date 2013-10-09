OCMigemo
=============

Migemo Text Search (http://0xcc.net/migemo/ ) for Objective-C

![](https://raw.github.com/laiso/OCMigemo/master/Documents/ScreenShot.png)

```objc:
#import <OCMigemo/OCMigemo.h>

OCMigemo* migemo = [OCMigemo new];
NSString* text = @"庭には二羽ニワトリがいる";
NSRange range = [migemo rangeOfSearch:@"hane" from:text];
if(range.location != NSNotFound){
  NSLog(@"%@ %@", NSStringFromRange(range), [text substringWithRange:range]);
}
```

```text:Console
{4, 1} 羽
```


INSTALL
==========

```ruby:Podfile
pod 'OCMigemo', :git => 'https://github.com/laiso/OCMigemo.git', :submodules => true
```````


LICENSE
==========

* OCMigemo / MIT
* cmigemo / MIT
