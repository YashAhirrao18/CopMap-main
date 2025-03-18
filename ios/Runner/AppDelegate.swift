import UIKit
import Flutter
import GoogleMaps //I added this manually from google maps documentation

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyBNE-O-_Gjtz9cJ6P46H4dQwFavVP6AXyo") //I added this manually from google maps documentation
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
