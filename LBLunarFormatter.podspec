Pod::Spec.new do |spec|
  spec.name         = "LBLunarFormatter"
  spec.version      = "0.0.1"
  spec.summary      = "中国农历的日期Formatter。"
  spec.description  = "中国农历的日期Formatter，支持农历的年、月、日，干支纪年、干支纪月、干支纪日，生肖和星座。"
  spec.homepage     = "https://github.com/A1129434577/LBLunarFormatter"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "刘彬" => "1129434577@qq.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => 'https://github.com/A1129434577/LBLunarFormatter.git', :tag => spec.version.to_s }
  spec.source_files = "LBLunarFormatter/**/*.{h,m}"
  spec.requires_arc = true
end
