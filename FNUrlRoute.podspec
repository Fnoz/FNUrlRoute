Pod::Spec.new do |s|

  s.name         = "FNUrlRoute"
  s.version      = "1.0.0"
  s.summary      = "Swift 路由框架：iOS 基于页面、模块的路由框架，解耦神器。"

  s.description  = <<-DESC
                   Swift 路由框架：iOS 基于页面、模块的路由框架，解耦神器。
                   DESC

  s.homepage     = "https://github.com/Fnoz/FNUrlRoute"
  s.license      = "MIT"
  s.authors            = { "Fnoz" => "fnoz@sina.com" }

  s.source       = { :git => "git@github.com:Fnoz/FNUrlRoute.git", :tag => s.version }
  s.source_files  = ["FNUrlRoute/FNUrlRoute/*.swift"]

  s.ios.deployment_target = "8.0"
  s.requires_arc = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
end