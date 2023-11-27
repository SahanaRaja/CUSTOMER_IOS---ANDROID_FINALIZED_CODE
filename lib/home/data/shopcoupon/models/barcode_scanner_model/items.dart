import 'dart:convert';

import 'package:equatable/equatable.dart';

class Items extends Equatable {
  final int? productRate;
  final String? nutritionsInfo;
  final String? manufacturerName;
  final String? productCode;
  final String? productDescription;
  final String? isNutritionsInfo;
  final String? offerDescription;
  final String? weightBy;
  final String? imageUrl;
  final int? tax2;
  final int? tax1;
  final String? soldBy;
  final String? isIngredientsInfo;
  final int? productMrp;
  final int? availableStockQuanty;
  final int? discountValue;
  final String? productName;
  final int? tax6;
  final int? tax5;
  final String? discountType;
  final int? tax4;
  final int? tax3;
  final String? companyDescription;
  final int? isWishlist;
  final String? uom;
  final String? netWeight;
  final String? ingredientsInfo;
  final String? isOfferItem;
  final String? brandName;
  final String? weighingFlag;
  final String? sku;
  final String? isProductInfo;
  final String? commonItem;
  final int? isFavoriteItem;
  final String? piecesBy;

  const Items({
    this.productRate,
    this.nutritionsInfo,
    this.manufacturerName,
    this.productCode,
    this.productDescription,
    this.isNutritionsInfo,
    this.offerDescription,
    this.weightBy,
    this.imageUrl,
    this.tax2,
    this.tax1,
    this.soldBy,
    this.isIngredientsInfo,
    this.productMrp,
    this.availableStockQuanty,
    this.discountValue,
    this.productName,
    this.tax6,
    this.tax5,
    this.discountType,
    this.tax4,
    this.tax3,
    this.companyDescription,
    this.isWishlist,
    this.uom,
    this.netWeight,
    this.ingredientsInfo,
    this.isOfferItem,
    this.brandName,
    this.weighingFlag,
    this.sku,
    this.isProductInfo,
    this.commonItem,
    this.isFavoriteItem,
    this.piecesBy,
  });

  factory Items.fromMap(Map<String, dynamic> data) => Items(
        productRate: data['PRODUCT_RATE'] as int?,
        nutritionsInfo: data['NUTRITIONS_INFO'] as String?,
        manufacturerName: data['MANUFACTURER_NAME'] as String?,
        productCode: data['PRODUCT_CODE'] as String?,
        productDescription: data['PRODUCT_DESCRIPTION'] as String?,
        isNutritionsInfo: data['IS_NUTRITIONS_INFO'] as String?,
        offerDescription: data['OFFER_DESCRIPTION'] as String?,
        weightBy: data['WEIGHT_BY'] as String?,
        imageUrl: data['IMAGE_URL'] as String?,
        tax2: data['TAX2'] as int?,
        tax1: data['TAX1'] as int?,
        soldBy: data['SOLD_BY'] as String?,
        isIngredientsInfo: data['IS_INGREDIENTS_INFO'] as String?,
        productMrp: data['PRODUCT_MRP'] as int?,
        availableStockQuanty: data['AVAILABLE_STOCK_QUANTY'] as int?,
        discountValue: data['DISCOUNT_VALUE'] as int?,
        productName: data['PRODUCT_NAME'] as String?,
        tax6: data['TAX6'] as int?,
        tax5: data['TAX5'] as int?,
        discountType: data['DISCOUNT_TYPE'] as String?,
        tax4: data['TAX4'] as int?,
        tax3: data['TAX3'] as int?,
        companyDescription: data['COMPANY_DESCRIPTION'] as String?,
        isWishlist: data['IS_WISHLIST'] as int?,
        uom: data['UOM'] as String?,
        netWeight: data['NET_WEIGHT'] as String?,
        ingredientsInfo: data['INGREDIENTS_INFO'] as String?,
        isOfferItem: data['IS_OFFER_ITEM'] as String?,
        brandName: data['BRAND_NAME'] as String?,
        weighingFlag: data['WEIGHING_FLAG'] as String?,
        sku: data['SKU'] as String?,
        isProductInfo: data['IS_PRODUCT_INFO'] as String?,
        commonItem: data['COMMON_ITEM'] as String?,
        isFavoriteItem: data['IS_FAVORITE_ITEM'] as int?,
        piecesBy: data['PIECES_BY'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'PRODUCT_RATE': productRate,
        'NUTRITIONS_INFO': nutritionsInfo,
        'MANUFACTURER_NAME': manufacturerName,
        'PRODUCT_CODE': productCode,
        'PRODUCT_DESCRIPTION': productDescription,
        'IS_NUTRITIONS_INFO': isNutritionsInfo,
        'OFFER_DESCRIPTION': offerDescription,
        'WEIGHT_BY': weightBy,
        'IMAGE_URL': imageUrl,
        'TAX2': tax2,
        'TAX1': tax1,
        'SOLD_BY': soldBy,
        'IS_INGREDIENTS_INFO': isIngredientsInfo,
        'PRODUCT_MRP': productMrp,
        'AVAILABLE_STOCK_QUANTY': availableStockQuanty,
        'DISCOUNT_VALUE': discountValue,
        'PRODUCT_NAME': productName,
        'TAX6': tax6,
        'TAX5': tax5,
        'DISCOUNT_TYPE': discountType,
        'TAX4': tax4,
        'TAX3': tax3,
        'COMPANY_DESCRIPTION': companyDescription,
        'IS_WISHLIST': isWishlist,
        'UOM': uom,
        'NET_WEIGHT': netWeight,
        'INGREDIENTS_INFO': ingredientsInfo,
        'IS_OFFER_ITEM': isOfferItem,
        'BRAND_NAME': brandName,
        'WEIGHING_FLAG': weighingFlag,
        'SKU': sku,
        'IS_PRODUCT_INFO': isProductInfo,
        'COMMON_ITEM': commonItem,
        'IS_FAVORITE_ITEM': isFavoriteItem,
        'PIECES_BY': piecesBy,
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
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productRate,
      nutritionsInfo,
      manufacturerName,
      productCode,
      productDescription,
      isNutritionsInfo,
      offerDescription,
      weightBy,
      imageUrl,
      tax2,
      tax1,
      soldBy,
      isIngredientsInfo,
      productMrp,
      availableStockQuanty,
      discountValue,
      productName,
      tax6,
      tax5,
      discountType,
      tax4,
      tax3,
      companyDescription,
      isWishlist,
      uom,
      netWeight,
      ingredientsInfo,
      isOfferItem,
      brandName,
      weighingFlag,
      sku,
      isProductInfo,
      commonItem,
      isFavoriteItem,
      piecesBy,
    ];
  }
}
