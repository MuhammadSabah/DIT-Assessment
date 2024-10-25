import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {

  private let batteryChannelName = "samples.flutter.dev/battery"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: batteryChannelName, binaryMessenger: controller.binaryMessenger)

    batteryChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: FlutterResult) in
      guard let self = self else { return }

      switch call.method {
      case "getBatteryInfo":
        self.handleGetBatteryInfo(result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func handleGetBatteryInfo(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true

    guard device.batteryState != .unknown else {
      result(FlutterError(code: "UNAVAILABLE", message: "Battery information not available.", details: nil))
      return
    }

    let batteryLevel = Int(device.batteryLevel * 100)
    let batteryStatus = getBatteryStatus(device.batteryState)

    let batteryInfo: [String: Any] = [
      "batteryLevel": batteryLevel,
      "status": batteryStatus
    ]

    result(batteryInfo)
  }

    private func getBatteryStatus(_ batteryState: UIDevice.BatteryState) -> String {
        switch batteryState {
        case .charging:
            return "Charging"
        case .full:
            return "Full"
        case .unplugged:
            return "Not charging"
        case .unknown:
            return "Unknown"
        @unknown default:
            return "Unknown"
        }
    }

}
