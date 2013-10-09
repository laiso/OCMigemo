Pod::Spec.new do |s|
  s.name         = "OCMigemo"
  s.version      = "0.0.1"
  s.summary      = "Migemo Text Search (http://0xcc.net/migemo/ ) for Objective-C"

  s.homepage     = "http://EXAMPLE/OCMigemo"
  s.license      = 'MIT'
  s.author       = { "laiso" => "laiso@lai.so" }
  #s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.source       = { :git => "https://github.com/laiso/OCMigemo.git", :submodules => true, :tag => "v#{s.version}" }
  s.source_files  = 'OCMigemo/**/*.{h,m}', 'Vendors/**/*.{h,c}'
  s.exclude_files = 'Vendors/cmigemo/src/testdir'

  # s.public_header_files = 'Classes/**/*.h'
  s.resource  = "OCMigemo/OCMigemo.bundle"
  # s.resources = "Resources/*.png"
  s.requires_arc = true
end
