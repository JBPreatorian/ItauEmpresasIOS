Pod::Spec.new do |s|

  s.name         = "SDKCore"
  s.version      = "2.1.1"
  s.summary      = "Itaú Mobile SDK iOS Core."

  s.description  = <<-DESC
                      SDK Core for iOS provides a system to send security request at Itau's backend.
                      DESC

  s.homepage     = "http://gitmobile.itau/framework/sdk-ios"
  s.license      = "Copyright"
  s.authors      = { "Carlos Irano" => "carlos.irano@itau-unibanco.com.br" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platforms = { :ios => "9.0", :watchos => "2.0" }

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "http://gitmobile.itau/framework/sdk-ios.git", :tag => s.version.to_s }

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.vendored_frameworks = "SDKiOSCore/SDKiOSCore.framework"

  s.framework  = "CoreLocation"

  s.subspec "Core" do |core|
    core.dependency 'AFNetworking', '3.0.4'
    core.dependency 'AFNetworkActivityLogger', '3.0.0'
    core.dependency 'CocoaLumberjack', '~> 3.4.2'
    core.dependency 'libextobjc', '~> 0.4.1'
    core.dependency 'SMXMLDocument', '1.2'
    core.dependency 'XMLDictionary', '~> 1.4'
    core.dependency 'Mantle'
    core.dependency 'SDKiOSRoutes'
  end
end
