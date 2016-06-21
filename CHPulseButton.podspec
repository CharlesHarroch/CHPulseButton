
Pod::Spec.new do |s|
  s.name             = 'CHPulseButton'
  s.version          = '1.0.0'
  s.summary          = 'Custom Animated UIButton'
  s.description      = <<-DESC
  iOS Custom UIButton with Pulse animation written in swift and fully customizable with Interface Builder.
                       DESC

  s.homepage         = 'https://github.com/CharlesHarroch/CHPulseButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Charles HARROCH' => 'charles.harroch@gmail.com' }
  s.source           = { :git => 'https://github.com/CharlesHarroch/CHPulseButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CHPulseButton/Classes/**/*'

  #s.resource_bundles = {
  #   'CHPulseButton' => ['CHPulseButton/Assets/*.png', 'CHPulseButton/**/*.xib']
  # }
  s.frameworks = 'UIKit', 'QuartzCore'
end
