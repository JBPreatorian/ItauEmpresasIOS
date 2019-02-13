# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'http://gitmobile.itau/framework/pod-specs.git'
source 'https://github.com/CocoaPods/Specs.git'

target 'ItauPassEmpresa' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'TextFieldEffects'
  pod 'SDKCore', '2.2.1'
  pod 'SnapKit', '~> 4.0.0'
  # pod 'IMCTooltip', :git => 'http://gitmobile.itau/componentes-ios/tooltip.git'
  # pod 'IMCTooltip',  ‘0.1.11’
  pod 'AMPopTip'
  # pod 'iOSUIComponentsCore', '= 0.0.3'

  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if target.name == ‘iOSUIComponentsCore’
              target.build_configurations.each do |config|
                  if config.name == ‘Debug’
                    config.build_settings[‘OTHER_SWIFT_FLAGS’] = ‘-DXCODE10’
                      
                      else
                      config.build_settings[‘OTHER_SWIFT_FLAGS’] = ‘-DXCODE10’
                  end
              end
          end
      end
  end
  
  target 'ItauPassEmpresaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ItauPassEmpresaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
