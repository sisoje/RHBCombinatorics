#
# Be sure to run `pod lib lint RHBCombinatorics.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RHBCombinatorics'
  s.version          = '0.1.1'
  s.summary          = 'Provide indexed access to combinations, for now.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Provide indexed access to combinations, iterate trough them, indexing...
                       DESC

  s.homepage         = 'https://github.com/sisoje/RHBCombinatorics'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lazar Otasevic' => 'redhotbits@gmail.com' }
  s.source           = { :git => 'https://github.com/sisoje/RHBCombinatorics.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/redhotbits'

  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '2.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'   
  
  s.source_files = 'RHBCombinatorics/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RHBCombinatorics' => ['RHBCombinatorics/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
