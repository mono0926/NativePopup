Pod::Spec.new do |s|
  s.name         = "NativePopup"
  s.version      = "2.1.0"
  s.summary      = "Clone of Apple iOS App's feedback popup, and easily customizable."
  s.homepage     = "https://github.com/mono0926/NativePopup"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Masayuki Ono"
  s.source       = { :git => "#{s.homepage}.git", :tag => s.version.to_s }
  s.platform     = :ios, '9.0'
  s.swift_version = '5.0'
  s.source_files = "NativePopup/**/*.swift"
end
