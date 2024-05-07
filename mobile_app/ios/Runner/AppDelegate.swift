import UIKit
import Flutter
import WatchConnectivity

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var session: WCSession?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        initFlutterChannel()
        if WCSession.isSupported() {
            print("Watch Session Supported")
            session = WCSession.default;
            session?.delegate = self;
            session?.activate();
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    private func initFlutterChannel() {
        if let controller = window?.rootViewController as? FlutterViewController {
            let channel = FlutterMethodChannel(
                name: "com.example.watchApp",
                binaryMessenger: controller.binaryMessenger)
            
            channel.setMethodCallHandler({ [weak self] (
                call: FlutterMethodCall,
                result: @escaping FlutterResult) -> Void in
                switch call.method {
                case "flutterToWatch":
                    print("flutterToWatch")
                    guard let watchSession = self?.session, watchSession.isPaired, watchSession.isReachable, let methodData = call.arguments as? [String: Any], let method = methodData["method"], let data = methodData["data"] else {
                        result(false)
                        return
                    }
                    
                    let watchData: [String: Any] = ["method": method, "data": data]
                    print(watchData)
                    
                    // Pass the receiving message to Apple Watch
                    watchSession.sendMessage(watchData) { (replaydata) in
                        print("\(replaydata)")
                    } errorHandler: { (err) in
                        print("\(err)")
                    }
                    
                    result(true)
                default:
                    result(FlutterMethodNotImplemented)
                }
            })
        }
    }
}

extension AppDelegate: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let method = message["method"] as? String, let controller = self.window?.rootViewController as? FlutterViewController {
                let channel = FlutterMethodChannel(
                    name: "com.example.watchApp",
                    binaryMessenger: controller.binaryMessenger)
                channel.invokeMethod(method, arguments: message)
            }
        }
    }
}
