<img src="https://massets.appsflyer.com/wp-content/uploads/2018/06/20092440/static-ziv_1TP.png"  width="400" > 

# iOS Migration Helper

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/AppsFlyerSDK/AppsFlyerMigrationHelper/blob/main/LICENSE)

🛠 In order for us to provide optimal support, we would kindly ask you to submit any issues to
support@appsflyer.com

> *When submitting an issue please specify your AppsFlyer sign-up (account) email , your app ID , production steps, logs, code snippets and any additional relevant information.

## Table Of Content
  * [This Module is Built for](#plugin-build-for)
  * [Adding The Migration Helper To Your Project](#install-connector)
    + [Cocoapods](#cocoapods)
    + [Carthage](#carthage)
    + [SPM](#spm)
  * [Basic Integration Of The Helper tool](#basic-integration)
    + [Set Attribution parameters](#set-attribution-parameters)
    + [Set DeepLink parameters](#set-deeplink-parameters)


## <a id="plugin-build-for"> This Module is Built for
- AppsFlyer SDK:
	•	6.16.2+
- Minimum iOS Version: 12


## <a id="cocoapods">  Adding The Migration Helper To Your Project via Cocoapods: 
Add to your Podfile and run `pod install`:
```
// for statically linked dependency
pod 'AppsFlyerMigrationHelper'
```


## <a id="carthage">  Adding The Connector To Your Project via Carthage: 
Go to the `Carthage` folder in the root of the repository. Open `AppsFlyerMigrationHelper-dynamic.json`, click raw, copy and paste the URL of the file to your `Cartfile`: 
```
binary "https://raw.githubusercontent.com/AppsFlyerSDK/appsflyer-apple-migration-helper/main/Carthage/AppsFlyerMigrationHelper-dynamic.json" == BIINARY_VERSION
```
Then open project folder in the terminal and use command `carthage update --use-xcframeworks`, then, drag and drop AppsFlyerMigrationHelper.xcframework binary (from Carthage/Build/iOS folder).

More reference on Carthage binary artifacts integration [here](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md).

## <a id="spm">  Adding The Connector To Your Project via SPM: 
To integrate the AppsFlyer Apple Migration Helper via Swift Package Manager (SPM):

1. In Xcode, go to File > Swift Packages > Add Package Dependency.

2. Enter the repository URL:
```
https://github.com/AppsFlyerSDK/appsflyer-apple-migration-helper
```

3. Choose the desired version or branch.

4. Select your project’s target and click Finish.


## <a id="basic-integration"> Basic Integration Of The AppsFlyerMigrationHelper

### <a id="set-attribution-parameters"> Set Attribution Parameters for AppsFlyerMigrationHelper
- Swift 
```swift
import AppsFlyerMigrationHelper
...
class AppDelegate: UIResponder, UIApplicationDelegate {
...
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ...
        Branch.getInstance().lastAttributedTouchData(withAttributionWindow:<#DAY>) { (params, error) in
            if let params = params {
                AFMigrationHelper.shared.setAttributionData(params.lastAttributedTouchJSON, attributionWindow: params.attributionWindow)
            }
        }
    ...
    }
}
```

### <a id="set-deeplink-parameters"> Set Deeplink Parameters for AppsFlyerMigrationHelper
- Swift 
```swift
import AppsFlyerMigrationHelper
...
class AppDelegate: UIResponder, UIApplicationDelegate {
...
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ...
        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            
            NSLog("[Branch] initSession, deep link data:")
            print(params as? [String: AnyObject] ?? {})
            // Access and use deep link data here (nav to page, display content, etc.)
            if (params?["~referring_link"] != nil){
                AFMigrationHelper.shared.setDeeplinkData(params)
            }
        }
    ...
    }
}    
```


## <a id="example"> Full Code Examples

### Swift Example 
```swift
import AppsFlyerLib
import AppsFlyerMigrationHelper
import BranchSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var ConversionData: [AnyHashable: Any]? = nil
    var window: UIWindow?
    var deferred_deep_link_processed_flag:Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let isBranchSDKAvailable = NSClassFromString("Branch") != nil

        Branch.enableLogging()
        
        if #available(iOS 16.0, *) {
                // Don't check pasteboard on install, instead utilize UIPasteControl
            } else if #available(iOS 15.0, *) {
                // Call `checkPasteboardOnInstall()` before Branch initialization
                Branch.getInstance().checkPasteboardOnInstall()
            }

            // Check if pasteboard toast will show
            if Branch.getInstance().willShowPasteboardToast(){
                // You can notify the user of what just occurred here
                NSLog("[Branch] willShowPasteboardToast ######")
          }

        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            
            NSLog("[Branch] initSession, deep link data:")
            print(params as? [String: AnyObject] ?? {})
            // Access and use deep link data here (nav to page, display content, etc.)
            if (params?["~referring_link"] != nil){
                AFMigrationHelper.shared.setDeeplinkData(params)
            }
        }
        
        Branch.getInstance().lastAttributedTouchData(withAttributionWindow:0) { (params, error) in
            if let params = params {
                AFMigrationHelper.shared.setAttributionData(params.lastAttributedTouchJSON, attributionWindow: params.attributionWindow)
            }
        }
        AppsFlyerLib.shared().appleAppID = "<apple app ID>"
        AppsFlyerLib.shared().appsFlyerDevKey = "<Appsflyer dev key>"
        AppsFlyerLib.shared().isDebug = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActiveNotification),
                name: UIApplication.didBecomeActiveNotification,
                object: nil)
        
        return true
    }
    
    @objc func didBecomeActiveNotification() {
        // No Listener
        AppsFlyerLib.shared().start()
        
    }
}
```
