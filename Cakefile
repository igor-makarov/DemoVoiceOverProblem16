require 'censorius'
require 'yaml'

project.name = 'DemoVoiceOverProblem16'

application_for :ios, '16' do |target|
  target.name = 'DemoVoiceOverProblem16'
  target.all_configurations.each do |config|
    config.product_bundle_identifier = 'com.moovit.demovoiceoverproblem16'
  end
end

project.before_save do |generated_project|
  generated_project.sort
  generator = Censorius::UUIDGenerator.new([generated_project])
  generator.generate!
  generator.write_debug_paths unless ENV['CENSORIUS_SPEC_DEBUG'].nil?
end

project.after_save do
  system "rm -rf \"#{project.name}.xcodeproj/xcshareddata/xcschemes\""
end
