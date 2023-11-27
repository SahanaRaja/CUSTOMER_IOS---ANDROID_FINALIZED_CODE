import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'pay_method.dart';
import 'tax.dart';

class Items extends Equatable {
  final int? creditLimit;
  final String? orderReferenceId;
  var totaltax;
  final String? customerId;
  var subtotal;
  final String? shopId;
  final List<Tax>? tax;
  final int? usedAmount;
  final double? totalvalue;
  final List<PayMethod>? payMethod;
  final int? bagFees;
  final int? balanceCredit;

  Items({
    this.creditLimit,
    this.orderReferenceId,
    this.totaltax,
    this.customerId,
    this.subtotal,
    this.shopId,
    this.tax,
    this.usedAmount,
    this.totalvalue,
    this.payMethod,
    this.bagFees,
    this.balanceCredit,
  });

  factory Items.fromMap(Map<String, dynamic> data) => Items(
        creditLimit: data['Credit_Limit'] as int?,
        orderReferenceId: data['OrderReferenceId'] as String?,
        totaltax: data['Totaltax'],
        customerId: data['Customer_Id'] as String?,
        subtotal: data['Subtotal'] ?? '0',
        shopId: data['Shop_Id'] as String?,
        tax: (data['TAX'] as List<dynamic>?)
            ?.map((e) => Tax.fromMap(e as Map<String, dynamic>))
            .toList(),
        usedAmount: data['Used_Amount'] as int?,
        totalvalue: (data['Totalvalue'] as num?)?.toDouble(),
        payMethod: (data['Pay_method'] as List<dynamic>?)
            ?.map((e) => PayMethod.fromMap(e as Map<String, dynamic>))
            .toList(),
        bagFees: data['Bag_Fees'] as int?,
        balanceCredit: data['Balance_Credit'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Credit_Limit': creditLimit,
        'OrderReferenceId': orderReferenceId,
        'Totaltax': totaltax,
        'Customer_Id': customerId,
        'Subtotal': subtotal,
        'Shop_Id': shopId,
        'TAX': tax?.map((e) => e.toMap()).toList(),
        'Used_Amount': usedAmount,
        'Totalvalue': totalvalue,
        'Pay_method': payMethod?.map((e) => e.toMap()).toList(),
        'Bag_Fees': bagFees,
        'Balance_Credit': balanceCredit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Items].
  factory Items.fromJson(String data) {
    return Items.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Items] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      creditLimit,
      orderReferenceId,
      totaltax,
      customerId,
      subtotal,
      shopId,
      tax,
      usedAmount,
      totalvalue,
      payMethod,
      bagFees,
      balanceCredit,
    ];
  }
}
