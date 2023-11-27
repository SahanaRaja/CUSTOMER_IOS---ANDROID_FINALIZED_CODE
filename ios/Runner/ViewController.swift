import UIKit
import RXPiOS

final class ViewController: FlutterViewController, HPPManagerDelegate, GenericHPPManagerDelegate {
    
    var flutterresult: FlutterResult!
    typealias PaymentServiceResponse = HPPResponse
    
    var orderId: String!
    var amount: String!
    var HPPREQUEST_PRODUCER_URL: String!
    var HPPRESPONSE_CONSUMER_URL: String!
    var HPPURL: String!
    var MERCHANT_ID: String!
    var CURRENCY: String!
    var ACCOUNT: String!
    var SHARED_SECRET: String!
    var REBATE_PASSWORD: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openPaymentPage()
    }
    
    
    func openPaymentPage() {
        let hppManager = HPPManager()
        hppManager.delegate = self

        
        hppManager.isEncoded = false
        hppManager.HPPRequestProducerURL = URL(string: "https://www.retailecoss.com/retailecos/api/hppRequestProducer")
        hppManager.HPPURL = URL(string: "https://pay.sandbox.realexpayments.com/pay")
        hppManager.HPPResponseConsumerURL = URL(string: "https://www.retailecoss.com/retailecos/api/hppResponseConsumer")
        hppManager.merchantId = "paceautomation"
        hppManager.amount = "100"
        hppManager.account = "internet"
        hppManager.currency = "CAD"
        hppManager.autoSettleFlag = "1"
        hppManager.presentViewInViewController(self)

    }
    func makePayment(orderId: String?, amount: String?,HPPREQUEST_PRODUCER_URL:String?,HPPRESPONSE_CONSUMER_URL:String?,HPPURL:String?,MERCHANT_ID:String?, CURRENCY:String?,ACCOUNT:String?,SHARED_SECRET:String?,REBATE_PASSWORD:String?,result: @escaping FlutterResult) {
        
        flutterresult = result
        
        // Default implementation
        
//        orderId = orderId
//        amount = amount
//        HPPREQUEST_PRODUCER_URL = HPPREQUEST_PRODUCER_URL
//        HPPRESPONSE_CONSUMER_URL = HPPRESPONSE_CONSUMER_URL
//        HPPURL = HPPURL
//        MERCHANT_ID = MERCHANT_ID
//        CURRENCY = CURRENCY
//        ACCOUNT = ACCOUNT
//        SHARED_SECRET = SHARED_SECRET
//        REBATE_PASSWORD = REBATE_PASSWORD
        let hppManager = HPPManager()
        hppManager.delegate = self

        
        hppManager.isEncoded = false
        hppManager.HPPRequestProducerURL = URL(string: "https://www.retailecoss.com/retailecos/api/hppRequestProducer")
        hppManager.HPPURL = URL(string: "https://pay.sandbox.realexpayments.com/pay")
        hppManager.HPPResponseConsumerURL = URL(string: "https://www.retailecoss.com/retailecos/api/hppResponseConsumer")
        hppManager.merchantId = "paceautomation"
        hppManager.amount = "100"
        hppManager.account = "internet"
        hppManager.currency = "CAD"
        hppManager.autoSettleFlag = "1"
        hppManager.presentViewInViewController(self)
        
    }

    // MARK: HPPManagerDelegate or GenericHPPManagerDelegate

    // Is called in case of GenericHPPManager<HPPResponse>()
    func HPPManagerCompletedWithResult(_ result: HPPResponse) {
        flutterresult(HPPResponse(orderID: "1", responseCode: "200", responseMessage: "Success"))
    }

    // Is called in case of regular HPPManager()
    func HPPManagerCompletedWithResult(_ result: [String: Any]) {
        flutterresult(HPPResponse(orderID: "1", responseCode: "200", responseMessage: "Success"))
    }

    func HPPManagerFailedWithError(_ error: Error?) {
        flutterresult(FlutterError(code: "Failed",
                                message: "Something went wrong",
                                details: nil))
    }

    func HPPManagerCancelled() {
        
        flutterresult(FlutterError(code: "Failed",
                                message: "Something went wrong",
                                details: nil))
        
    }
}
