#
# Be sure to run `pod lib lint RGCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RGCategory'
  s.version          = '0.0.7'
  s.summary          = 'RGCategory'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "常用分类"
  s.homepage         = 'https://github.com/iOSRG/RGCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.license          = 'MIT'
  s.author           = { '18607304107@163.com' => 'gui.ren@hand-china.com' }
  s.source           = { :git => 'https://github.com/iOSRG/RGCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  #s.source_files = 'RGCategory/Classes/**/*'
  
  s.subspec 'CALayer' do |sc|
      sc.source_files = 'RGCategory/Classes/CALayer/**/*'
  end
  
  s.subspec 'NSArray' do |sa|
      sa.source_files = 'RGCategory/Classes/NSArray/**/*'
  end
  
  s.subspec 'NSAttributedString' do |sat|
      sat.source_files = 'RGCategory/Classes/NSAttributedString/**/*'
  end
  
  s.subspec 'NSDate' do |sd|
      sd.source_files = 'RGCategory/Classes/NSDate/**/*'
  end
  
  s.subspec 'NSObject' do |so|
      so.source_files = 'RGCategory/Classes/NSObject/**/*'
      so.dependency 'SDWebImage', '~> 5.1.0'
      
  end
  
  s.subspec 'NSString' do |sst|
      sst.source_files = 'RGCategory/Classes/NSString/**/*'
  end
  
  s.subspec 'RGView' do |svi|
      svi.source_files = 'RGCategory/Classes/RGView/**/*'
  end
  
  s.subspec 'UIcolor' do |sco|
      sco.source_files = 'RGCategory/Classes/UIcolor/**/*'
  end
  
  s.subspec 'UIFont' do |sfo|
      sfo.source_files = 'RGCategory/Classes/UIFont/**/*'
  end
  
  s.subspec 'UIImage' do |sim|
      sim.source_files = 'RGCategory/Classes/UIImage/**/*'
  end
  
  s.subspec 'UIView' do |svi|
      svi.source_files = 'RGCategory/Classes/UIView/**/*'
  end
  
  s.subspec 'Extension_MAS' do |sex|
      sex.source_files = 'RGCategory/Classes/Extension_MAS/**/*'
      sex.dependency 'Masonry', '~> 1.1.0'
  end
  
  s.subspec 'UIAlertView' do |sal|
      sal.source_files = 'RGCategory/Classes/UIAlertView/**/*'
  end
  
  s.subspec 'UIDevice' do |sud|
      sud.source_files = 'RGCategory/Classes/UIDevice/**/*'
      sud.dependency 'SSKeychain', '~> 1.2.3'
  end
  
  #s.subspec 'AppDelegate' do |sad|
  #sad.source_files = 'RGCategory/Classes/AppDelegate/**/*'
  #sad.dependency 'JPush', '3.2.2-noidfa'
  #end
  
  
  
  
  # s.resource_bundles = {
  #   'RGCategory' => ['RGCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  #s.dependency 'Masonry', '~> 1.1.0'
end
