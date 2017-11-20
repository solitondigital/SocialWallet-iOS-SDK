# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SocialWallet-iOS-SDK-Demo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SocialWallet-iOS-SDK-Demo
  pod 'SocialWalletSDK'
  pod 'CallbackURLKit'

  target 'SocialWallet-iOS-SDK-DemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SocialWallet-iOS-SDK-DemoUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
      # Your list of targets here.
      myTargets = ['CryptoSwift', 'Eureka', 'CallbackURLKit', 'Kingfisher', 'Alamofire']
      
      installer.pods_project.targets.each do |target|
          if myTargets.include? target.name
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '4.0'
              end
          end
      end
  end
  
end
