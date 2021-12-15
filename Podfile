# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
inhibit_all_warnings!

target 'Meals' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Meals
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher.git', :branch => 'version6-xcode13'

  # Testing
  pod 'Sourcery'
  
  # Navigation
  pod 'NavigationStack'
  
  target 'MealsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MealsUITests' do
    # Pods for testing
  end
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              if config.name == 'Debug'
                  config.build_settings['ENABLE_TESTABILITY'] = 'YES'
              end
          end
      end
  end
end
