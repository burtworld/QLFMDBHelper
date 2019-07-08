#
# Be sure to run `pod lib lint QLSqliterHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QLFMDBHelper'
  s.version          = '0.1.0'
  s.summary          = 'A sqlite wrap base on FMDB'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'easier to use sqlite and resolve ORM'

  s.homepage         = 'https://github.com/burtworld/QLFMDBHelper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paramita' => 'baqkoo007@aliyun.com' }
  s.source           = { :git => 'https://github.com/burtworld/QLFMDBHelper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QLFMDBHelper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QLSqliterHelper' => ['QLFMDBHelper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Security'
  s.dependency 'FMDB/SQLCipher', '~>  2.7.5'
end
