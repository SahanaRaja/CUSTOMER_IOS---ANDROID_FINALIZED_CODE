import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
  
      
        GMSServices.provideAPIKey("AIzaSyD3WvOfx9sIh8DPdDOkFoA-5ypIs2eDt0Y")
      
      let paymentChannel = FlutterMethodChannel(name: "samples.flutter.dev/payment",
                                                binaryMessenger: controller.binaryMessenger)
      paymentChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case "makePayment":
              self.startPayment(call:call,result:result);
          default:
              result(FlutterMethodNotImplemented);
            
          }
          

      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    func startPayment(call:FlutterMethodCall,result:@escaping FlutterResult){
        guard let args = call.arguments as? [String : Any] else {return}
                let orderId = args["orderId"] as? String
                let amount = args["amount"] as? String
                let HPPREQUEST_PRODUCER_URL = args["HPPREQUEST_PRODUCER_URL"] as? String
                let HPPRESPONSE_CONSUMER_URL = args["HPPRESPONSE_CONSUMER_URL"] as? String
                let HPPURL = args["HPPURL"] as? String
                let MERCHANT_ID = args["MERCHANT_ID"] as? String
                let CURRENCY = args["CURRENCY"] as? String
                let ACCOUNT = args["ACCOUNT"] as? String
                let SHARED_SECRET = args["SHARED_SECRET"] as? String
                let REBATE_PASSWORD = args["REBATE_PASSWORD"] as? String
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.window.rootViewController?.present(vc, animated: true, completion: nil)
        vc.makePayment(orderId: orderId, amount: amount, HPPREQUEST_PRODUCER_URL: HPPREQUEST_PRODUCER_URL, HPPRESPONSE_CONSUMER_URL: HPPRESPONSE_CONSUMER_URL, HPPURL: HPPURL, MERCHANT_ID: MERCHANT_ID, CURRENCY: CURRENCY, ACCOUNT: ACCOUNT, SHARED_SECRET: SHARED_SECRET, REBATE_PASSWORD: REBATE_PASSWORD,result: result)
        
        self.window?.makeKeyAndVisible()
    }
  
}
