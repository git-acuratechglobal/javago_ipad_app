import Flutter
import UIKit
import Firebase
import flutter_local_notifications
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     FirebaseApp.configure()
     GeneratedPluginRegistrant.register(with: self)
     FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
                GeneratedPluginRegistrant.register(with: registry)
        }

        if #available(iOS 10.0, *) {
           UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
      }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}
