Pod::Spec.new do |s|
  s.name             = 'SheetKit'
  s.version          = '0.1.2'
  s.summary          = 'A lightweight, user-friendly Swift library to create adaptive card-styled UI for action sheet and interactive bottom sheets easily
'
  s.description      = <<-DESC
SheetKit lets you create bottom sheets with just few lines of code. It also provides a modern looking action sheet for both iPad and iPhone. And yes it supports dark mode just like any other UIView in UIKit does.

SheetKit supports ActionItem types like button, title, cancelButton, destructiveButton and separator. You can also create a custom styled item for the sheet. The color, image, imageTintColor of button is all customizable. Button without image is also possible.

SheetKit also provides BottomSheets called as PreviewViewController in the kit. These components interactively grow on dragging, occupying the required space only on both brief and detail mode. The heights of each mode is completely customizable.​
                       DESC
  s.homepage         = 'https://github.com/akaashdev/SheetKit'
  s.screenshots      = 'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-iphone-1.png?raw=true',
                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-iphone-2.png?raw=true',
                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-iphone-3.png?raw=true',
                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-iphone-4.png?raw=true',
                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-iphone-5.png?raw=true',
                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-iphone-6.png?raw=true',
                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-ipad-1.png?raw=true',
                       'https://github.com/akaashdev/SheetKit/blob/master/Screenshots/screenshot-ipad-2.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Akaash Dev S C' => 'heatblast.akaash@gmail.com' }
  s.source           = { :git => 'https://github.com/akaashdev/SheetKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/akaash_dev'
  s.ios.deployment_target = '11.0'
  s.source_files = 'SheetKit/Classes/**/*'
  s.swift_version = '5.0'
end
