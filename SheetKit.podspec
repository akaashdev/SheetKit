#
# Be sure to run `pod lib lint SheetKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SheetKit'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight, user-friendly Swift library to create adaptive card-styled UI for action sheet and interactive bottom sheets easily
'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SheetKit lets you create bottom sheets with just few lines of code. It also provides a modern looking action sheet for both iPad and iPhone. And yes it supports dark mode just like any other UIView in UIKit does.

SheetKit supports ActionItem types like button, title, cancelButton, destructiveButton and separator. You can also create a custom styled item for the sheet. The color, image, imageTintColor of button is all customizable. Button without image is also possible.

SheetKit also provides BottomSheets called as PreviewViewController in the kit. These components interactively grow on dragging, occupying the required space only on both brief and detail mode. The heights of each mode is completely customizable.​
                       DESC

  s.homepage         = 'https://github.com/akaashdev/SheetKit'
#  s.screenshots      = 'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screen-record-iphone-1.gif',
#                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screen-record-ipad-1.gif',
#                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screen-record-ipad-2.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Akaash Dev S C' => 'heatblast.akaash@gmail.com' }
  s.source           = { :git => 'https://github.com/akaashdev/SheetKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/akaash_dev'

  s.ios.deployment_target = '11.0'

  s.source_files = 'SheetKit/Classes/**/*'
  s.swift_versions = '5.0'
  
  # s.resource_bundles = {
  #   'SheetKit' => ['SheetKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
