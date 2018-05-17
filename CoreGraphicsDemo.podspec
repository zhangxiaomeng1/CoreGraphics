#
# Be sure to run `pod lib lint CoreGraphicsDemo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreGraphicsDemo'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CoreGraphicsDemo.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'iOS系统本身提供了两套绘图的框架，即 UIBezierPath 和** Core Graphics**。而前者所属UIKit，其实是对Core Graphics框架关于path的进一步封装，所以使用起来比较简单。但是毕竟Core Graphics更接近底层，所以它更加强大。'

  s.homepage         = 'https://github.com/zhangxieomeng1/CoreGraphicsDemo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangxieomeng1' => 'zhangxiaomeng@xiangshang360.com' }
  s.source           = { :git => 'https://github.com/zhangxieomeng1/CoreGraphicsDemo.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CoreGraphicsDemo/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CoreGraphicsDemo' => ['CoreGraphicsDemo/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
