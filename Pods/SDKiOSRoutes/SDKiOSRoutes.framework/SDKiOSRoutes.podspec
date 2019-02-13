Pod::Spec.new do |s|
  s.name         = "SDKiOSRoutes"
  s.version      = "1.2.0"
  s.summary      = "Itaú Mobile SDK iOS Routes."

  s.description  = <<-DESC
                      SDK Routes for iOS provides the set of URLs based on its reference countries.
                      DESC

  s.homepage     = "http://gitmobile.itau/framework-mobile/componentes/distribuidos-ios/ios-url"
  s.license      = "Copyright"
  s.authors      = { "Diego Faria" => "diego.faria@itau-unibanco.com.br"}

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios
  s.ios.deployment_target = "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "http://gitmobile.itau/framework-mobile/componentes/distribuidos-ios/ios-url.git", :tag => s.version.to_s }

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.vendored_frameworks = "SDKiOSRoutes.framework"
end
