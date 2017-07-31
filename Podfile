source 'https://github.com/CocoaPods/Specs.git'

platform:ios,'8.0'
use_frameworks!
# ignore all warnings from all pods
inhibit_all_warnings!

def pods
	#Swift
	pod 'Alamofire'
	pod 'SnapKit'
	pod 'GCDWebServer', :git=> 'https://github.com/swisspol/GCDWebServer.git'

	#Objective-C
end

target 'HJPrivateCenter' do
	pods
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['ENABLE_BITCODE'] = 'YES'
			config.build_settings['SWIFT_VERSION'] = '3.0'
		end
	end
end
