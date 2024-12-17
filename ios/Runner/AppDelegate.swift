import UIKit
import Flutter
import Combine

@main
@objc class AppDelegate: FlutterAppDelegate {

    private let stepCounterManager = StepCounterManager()
    private var stepCountChannel: FlutterMethodChannel?
    private var cancellable: AnyCancellable? // Combine 스트림 구독

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        stepCountChannel = FlutterMethodChannel(
            name: "step_counter_channel",
            binaryMessenger: controller.binaryMessenger
        )

        stepCountChannel?.setMethodCallHandler { [weak self] (call, result) in
            guard let self = self else { return }
            switch call.method {
            case "startPedometer":
                self.startStepUpdates()
                result(nil)
            case "stopPedometer":
                self.stopStepUpdates()
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func startStepUpdates() {
        // Combine Publisher 구독
        cancellable = stepCounterManager.stepPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] stepCount in
                self?.stepCountChannel?.invokeMethod("onStepCount", arguments: stepCount)
            }
        stepCounterManager.startStepCounting()
    }

    private func stopStepUpdates() {
        stepCounterManager.stopStepCounting()
        cancellable?.cancel()
        cancellable = nil
    }
}
