import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import 'payment_configurations.dart' as payment_configurations;

class PayDemo extends StatefulWidget {
  const PayDemo({Key? key}) : super(key: key);

  @override
  PayDemoState createState() => PayDemoState();
}

class PayDemoState extends State<PayDemo> {
  late Future<PaymentConfiguration> googlePayConfigFuture;

  @override
  void initState() {
    super.initState();
    googlePayConfigFuture =
        PaymentConfiguration.fromAsset('default_google_pay_config.json');
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  final _paymentItems = [
    const PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GooglePayButton(
          paymentConfiguration: PaymentConfiguration.fromJsonString(
            payment_configurations.defaultGooglePay,
          ),
          paymentItems: _paymentItems,
          type: GooglePayButtonType.pay,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: onGooglePayResult,
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
