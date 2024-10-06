Pod::Spec.new do |spec|

  spec.name         = "AlertViewModifier"
  spec.version      = "1.0.0"
  spec.summary      = "This is the best framework"
  spec.description  = "I have no idea what to write as a description"

  spec.homepage     = "https://github.com/nangnguyendtu/AlertViewModifier"
  spec.license      = "MIT"
  spec.author             = { "Nang Nguyen" => "nangnguyendtu@gmail.com" }
  spec.platform     = :ios, "17.2"
  spec.source       = { :git => "https://github.com/nangnguyendtu/AlertViewModifier.git", :tag => spec.version.to_s }
  spec.source_files  = "AlertViewModifier/**/*.{swift}"
  spec.swift_versions = "5.0"
end
