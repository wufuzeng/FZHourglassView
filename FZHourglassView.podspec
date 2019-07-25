#
# Be sure to run `pod lib lint FZHourglassView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FZHourglassView'
  s.version          = '0.0.1'
  s.summary          = 'A short description of FZHourglassView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wufuzeng/FZHourglassView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wufuzeng' => 'wufuzeng_lucky@sina.com' }
  s.source           = { :git => 'https://github.com/wufuzeng/FZHourglassView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.public_header_files = 'FZHourglassView/Classes/FZHourglassView.h'
  s.source_files = 'FZHourglassView/Classes/*.{h,m}'
  
  # s.resource_bundles = {
  #   'FZHourglassView' => ['FZHourglassView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  
end
