// ignore_for_file: must_be_immutable, prefer_const_constructors
import 'package:customer_assist/core/app_colors.dart';
import 'package:flutter/material.dart';

class FUTURECouponPage extends StatefulWidget {
  double actualHeight;
  FUTURECouponPage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<FUTURECouponPage> createState() => _FUTURECouponPageState();
}

class _FUTURECouponPageState extends State<FUTURECouponPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
            child: Center(
                child: Text(
              "Coupons",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
          ),
        ],
      ),
    );
  }
}
