// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   late Razorpay _razorpay;

  

  

//   void _startPayment() {
//     var options = {
//       'key': 'rzp_test_OdDMLuhDT3iptA',
//       'amount': 1.5 * 100,
//       'name': 'My Store',
//       'description': 'Payment',
//       'prefill': {'contact': '8098858076', 'email': 'example@email.com'},
//       'external': {
//          'wallets': ['paytm']
//        }
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: ${e.toString()}');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//    // Fluttertoast.showToast(msg: 'Payment Successful'+ response.paymentId!,toastLength: Toast.LENGTH_SHORT);
//     String? paymentId = response.paymentId;
//     String? orderId = response.orderId;
//     String? signature = response.signature;
//     print('Payment Success: Payment ID - $paymentId, Order ID - $orderId');
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     //Fluttertoast.showToast(msg: 'Payment Fail'+ response.message!,toastLength: Toast.LENGTH_SHORT);
//     int? code = response.code;
//     String? message = response.message;
//     print('Payment Error: Code - $code, Message - $message');
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     //Fluttertoast.showToast(msg: 'External Wallet'+ response.walletName!,toastLength: Toast.LENGTH_SHORT);
//     String? walletName = response.walletName;
//     print('External Wallet: $walletName');
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Razorpay Payment'),
//   //     ),
//   //     body: Center(
//   //       child: ElevatedButton(
//   //         child: Text('Proceed to Payment'),
//   //         onPressed: _startPayment,
//   //       ),
//   //     ),
//   //   );
//   // }
// }
