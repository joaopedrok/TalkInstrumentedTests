# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'TalkInstrumentedTests' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'SnapKit', '~> 4.0.0'
  pod 'IQKeyboardManagerSwift', '5.0.0'

  target 'TalkInstrumentedTestsTests' do
    inherit! :search_paths
  end

  target 'TalkInstrumentedTestsKifTests' do
    inherit! :search_paths
    pod 'KIF'
    pod 'KIF/IdentifierTests'
    pod 'Quick'
    pod 'Nimble'
  end

end
