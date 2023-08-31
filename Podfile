require 'censorius'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'DemoVoiceOverProblem16' do
  platform :ios, '16'
  pod 'PureLayout'
end

post_install do |installer|
  generated_projects = installer.generated_projects
  generated_projects.each do |project|
    generator = Censorius::UUIDGenerator.new([project])
    generator.generate!
    generator.write_debug_paths unless ENV['CENSORIUS_SPEC_DEBUG'].nil?
  end

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
post_integrate do |_installer|
  user_project = Xcodeproj::Project.open('DemoVoiceOverProblem16.xcodeproj')
  user_project.sort
  generator = Censorius::UUIDGenerator.new([user_project])
  generator.generate!
  generator.write_debug_paths unless ENV['CENSORIUS_SPEC_DEBUG'].nil?
  user_project.save
end
