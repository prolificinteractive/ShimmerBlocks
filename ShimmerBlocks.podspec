#
# Be sure to run `pod lib lint ShimmerBlocks.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ShimmerBlocks'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ShimmerBlocks.'

  s.description      = <<-DESC
Add blocked shimmering views to your view components.
                       DESC

  s.homepage         = 'https://github.com/prolificinteractive/ShimmerBlocks'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jgsamudio' => 'jonathan@prolificinteractive.com' }
  s.source           = { :git => 'https://github.com/prolificinteractive/ShimmerBlocks.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'ShimmerBlocks/Classes/**/*'
  
  s.dependency 'Shimmer', '~> 1.0.2'
  s.dependency 'PureLayout', '~> 3.0.2'

end
