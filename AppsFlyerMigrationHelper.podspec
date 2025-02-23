Pod::Spec.new do |s|

    s.name             = 'AppsFlyerMigrationHelper'
    s.version          = "6.16.2"
    s.summary          = 'AppsFlyer iOS SDK Migration Helper'

    s.description      = <<-DESC
    The AppsFlyerMigrationHelper Module collects attribution and deep linking data,
    enabling seamless migration alongside the AppsFlyer SDK. It ensures accurate tracking of user acquisition
    and engagement while allowing independent updates from the main SDK, minimizing developer effort.
    DESC

    s.homepage         = 'https://www.appsflyer.com'
    s.license          = { :type => 'Proprietary', :text => 'Copyright 2018 AppsFlyer Ltd. All rights reserved.' }
    s.author           = { 'Amit Kremer' => 'amit-kremer93\@appsflyer.com', 'af-obodovskyi' => 'ivan.obodovskyi\@appsflyer.com', 'Veronica' => 'af-vero\@appsflyer.com', 'Moris' => 'morisgateno-appsflyer\@appsflyer.com', 'Amit' => 'al-af\@appsflyer.com'}
    s.source           = { :git => 'https://github.com/AppsFlyerSDK/AppsFlyerMigrationHelper.git', :tag => s.version.to_s }
    s.requires_arc = true
    s.platform     = :ios
    s.ios.deployment_target = '12.0'
    s.ios.frameworks = 'StoreKit'
    s.default_subspecs = 'Main'
    s.swift_version = '5.0'

    s.subspec 'Main' do |ss|
        ss.ios.preserve_paths = 'Dynamic/AppsFlyerMigrationHelper.xcframework'
        ss.ios.vendored_frameworks = 'Dynamic/AppsFlyerMigrationHelper.xcframework'
        ss.ios.resource_bundles = {'AppsFlyerMigrationHelper_Privacy' => ['Resources/PrivacyInfo.xcprivacy']}
     end

end
