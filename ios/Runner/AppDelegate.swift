// import UIKit
// import Flutter
// import GoogleMaps

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//     override func application(
//         _ application: UIApplication,
//         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//     ) -> Bool {
//         GMSServices.provideAPIKey("AIzaSyCSDToseHMtLUAZDPvk8tw5YbMWToxr75A")
//         GeneratedPluginRegistrant.register(with: self)
//         return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//     }
// }
import UIKit
import Flutter
import Firebase
import FirebaseMessaging
import GoogleMaps
@UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
        override func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            FirebaseApp.configure()
            GMSServices.provideAPIKey("AIzaSyCSDToseHMtLUAZDPvk8tw5YbMWToxr75A")
            //Messaging.messaging().delegate = self
            GeneratedPluginRegistrant.register(with: self)
            if #available(iOS 10.0, *) {
                // For iOS 10 display notification (sent via APNS)
                UNUserNotificationCenter.current().delegate = self
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: {_, _ in })
            } else {
                let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
            }
            application.registerForRemoteNotifications()
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        override func application(_ application: UIApplication,
                                  didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            
            Messaging.messaging().apnsToken = deviceToken
            print("Token: \(deviceToken)")
            super.application(application,
                              didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }








// import UIKit
// import Flutter
// import GoogleMaps

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     GMSServices.provideAPIKey("AIzaSyCSDToseHMtLUAZDPvk8tw5YbMWToxr75A")
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }
