import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PayNow extends StatefulWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  State<PayNow> createState() => _PayNowState();
}

class _PayNowState extends State<PayNow> {

  TextEditingController pay = TextEditingController();


  void onGooglePayResult(paymentResult) {
    print(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: pay,
              decoration: InputDecoration(
                  label: Text("Amount"),
                  prefix: Text("₹ ",style: TextStyle(
                      color: Colors.blue
                  ),)
              ),
            ),
          ),
          GooglePayButton(
            height: 50,
            width: 200,
            paymentConfigurationAsset:
            'default_payment_profile_google_pay.json',
            paymentItems: const [
              PaymentItem(
                label: 'Total',
                amount: '99.99',
                status: PaymentItemStatus.final_price,
              )
            ],
            style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: onGooglePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      )
    );
  }
}
