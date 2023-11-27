// ignore_for_file: unused_local_variable

import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/helpers/SharedPreference/prefs.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PayByCardController extends GetxController {
  ViewController viewController = Get.find();
  var orderController = Get.put(OrderController());
  var reviewController = Get.put(PaymentReviewController());
  AddCartReviewController addCartReviewController = Get.find();
  var configureController = Get.put(ConfigureController());
  
  late Razorpay _razorpay;

 

 startPayment() async {
    print(await Prefs.mobile);
    print(await Prefs.orderAmount);
    
    var options = {
      'key': 'rzp_test_OdDMLuhDT3iptA',
      'amount': (await Prefs.orderAmount) * 100 ,
      'name':configureController.shopname.value ,
      'description': 'Payment',
      'prefill': {'contact': '$Prefs.mobile'},
      'external': {
        'wallets': ['paytm']
       }
    };
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
 try {
      _razorpay.open(options);
          

    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response)async {
    String? paymentId = response.paymentId;
    String? orderId = await Prefs.orderId;
    String? signature = response.signature;
    print('Payment Success: Payment ID - $paymentId, Order ID - $orderId');
    
  }

  void _handlePaymentError(PaymentFailureResponse response) {
   int? code = response.code;
    String? message = response.message;
    print('Payment Error: Code - $code, Message - $message');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    String? walletName = response.walletName;
    print('External Wallet: $walletName');
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  
}
