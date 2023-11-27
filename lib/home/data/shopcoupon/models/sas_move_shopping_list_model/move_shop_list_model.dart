import 'dart:convert';

import 'package:equatable/equatable.dart';

class MoveShopListModel extends Equatable {
  final int? productRate;
  final String? manufacturerName;
  final String? productCode;
  final int? qty;
  final String? weightBy;
  final String? imageUrl;
  final dynamic tax2;
  final dynamic tax1;
  final String? soldBy;
  final int? productMrp;
  final int? availableStockQuanty;
  final int? discountValue;
  final String? productName;
  final dynamic tax6;
  final dynamic tax5;
  final String? discountType;
  final dynamic tax4;
  final dynamic tax3;
  final String? uom;
  final String? netWeight;
  final String? isOfferItem;
  final String? brandName;
  final String? weighingFlag;
  final int? isFavoriteItem;
  final String? commonItem;

  const MoveShopListModel({
    this.productRate,
    this.manufacturerName,
    this.productCode,
    this.qty,
    this.weightBy,
    this.imageUrl,
    this.tax2,
    this.tax1,
    this.soldBy,
    this.productMrp,
    this.availableStockQuanty,
    this.discountValue,
    this.productName,
    this.tax6,
    this.tax5,
    this.discountType,
    this.tax4,
    this.tax3,
    this.uom,
    this.netWeight,
    this.isOfferItem,
    this.brandName,
    this.weighingFlag,
    this.isFavoriteItem,
    this.commonItem,
  });

  factory MoveShopListModel.fromMap(Map<String, dynamic> data) {
    return MoveShopListModel(
      productRate: data['PRODUCT_RATE'] as int?,
      manufacturerName: data['MANUFACTURER_NAME'] as String?,
      productCode: data['PRODUCT_CODE'] as String?,
      qty: data['QTY'] as int?,
      weightBy: data['WEIGHT_BY'] as String?,
      imageUrl: data['IMAGE_URL'] as String?,
      tax2: data['TAX2'] as dynamic,
      tax1: data['TAX1'] as dynamic,
      soldBy: data['SOLD_BY'] as String?,
      productMrp: data['PRODUCT_MRP'] as int?,
      availableStockQuanty: data['AVAILABLE_STOCK_QUANTY'] as int?,
      discountValue: data['DISCOUNT_VALUE'] as int?,
      productName: data['PRODUCT_NAME'] as String?,
      tax6: data['TAX6'] as dynamic,
      tax5: data['TAX5'] as dynamic,
      discountType: data['DISCOUNT_TYPE'] as String?,
      tax4: data['TAX4'] as dynamic,
      tax3: data['TAX3'] as dynamic,
      uom: data['UOM'] as String?,
      netWeight: data['NET_WEIGHT'] as String?,
      isOfferItem: data['IS_OFFER_ITEM'] as String?,
      brandName: data['BRAND_NAME'] as String?,
      weighingFlag: data['WEIGHING_FLAG'] as String?,
      isFavoriteItem: data['IS_FAVORITE_ITEM'] as int?,
      commonItem: data['COMMON_ITEM'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'PRODUCT_RATE': productRate,
        'MANUFACTURER_NAME': manufacturerName,
        'PRODUCT_CODE': productCode,
        'QTY': qty,
        'WEIGHT_BY': weightBy,
        'IMAGE_URL': imageUrl,
        'TAX2': tax2,
        'TAX1': tax1,
        'SOLD_BY': soldBy,
        'PRODUCT_MRP': productMrp,
        'AVAILABLE_STOCK_QUANTY': availableStockQuanty,
        'DISCOUNT_VALUE': discountValue,
        'PRODUCT_NAME': productName,
        'TAX6': tax6,
        'TAX5': tax5,
        'DISCOUNT_TYPE': discountType,
        'TAX4': tax4,
        'TAX3': tax3,
        'UOM': uom,
        'NET_WEIGHT': netWeight,
        'IS_OFFER_ITEM': isOfferItem,
        'BRAND_NAME': brandName,
        'WEIGHING_FLAG': weighingFlag,
        'IS_FAVORITE_ITEM': isFavoriteItem,
        'COMMON_ITEM': commonItem,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MoveShopListModel].
  factory MoveShopListModel.fromJson(String data) {
    return MoveShopListModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MoveShopListModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productRate,
      manufacturerName,
      productCode,
      qty,
      weightBy,
      imageUrl,
      tax2,
      tax1,
      soldBy,
      productMrp,
      availableStockQuanty,
      discountValue,
      productName,
      tax6,
      tax5,
      discountType,
      tax4,
      tax3,
      uom,
      netWeight,
      isOfferItem,
      brandName,
      weighingFlag,
      isFavoriteItem,
      commonItem,
    ];
  }
}
