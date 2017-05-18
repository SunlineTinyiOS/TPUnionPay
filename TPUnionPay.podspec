#
# Be sure to run `pod lib lint TPUnionPay.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TPUnionPay'
  s.version          = '0.0.1'
  s.summary          = '银联支付'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/SunlineTinyiOS/TPUnionPay'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kingdomrain' => 'bygd2014@sina.com' }
  s.source           = { :git => 'https://github.com/SunlineTinyiOS/TPUnionPay.git'}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'TPUnionPay/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TPUnionPay' => ['TPUnionPay/Assets/*.png']
  # }

  #s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = "Foundation", "UIKit", "CFNetwork", "SystemConfiguration"

  s.libraries = "z", "stdc++"
  s.vendored_libraries = "TPUnionPay/Assets/libPaymentControl.a"


  # s.dependency 'AFNetworking', '~> 2.3'
end
