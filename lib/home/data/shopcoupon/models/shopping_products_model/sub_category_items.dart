import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubCategoryItems extends Equatable {
  var productRate;
  var averageRatings;
  var totalReview;
  final String? nutritionsInfo;
  final String? manufacturerName;
  final String? productCode;
  final String? isNutritionsInfo;
  final String? offerDescription;
  final String? imageUrl;
  final dynamic tax2;
  final dynamic tax1;
  final String? soldBy;
  final String? isIngredientsInfo;
  var productMrp;
  final int? availableStockQuanty;
  final int? discountValue;
  final String? productName;
  final dynamic tax6;
  final dynamic tax5;
  final String? discountType;
  final dynamic tax4;
  final dynamic tax3;
   var isWishlist;
  final String? uom;
  final String? netWeight;
  final String? ingredientsInfo;
  final String? isOfferItem;
  final String? brandName;
  final String? weighingFlag;
  final int? isFavoriteItem;
  final String? commonItem;
  final String? categoryname;
  final String? subcategoryName;

  SubCategoryItems({
    this.productRate,
    this.averageRatings,
    this.totalReview,
    this.nutritionsInfo,
    this.manufacturerName,
    this.productCode,
    this.isNutritionsInfo,
    this.offerDescription,
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
    this.isWishlist,
    this.uom,
    this.netWeight,
    this.ingredientsInfo,
    this.isOfferItem,
    this.brandName,
    this.weighingFlag,
    this.isFavoriteItem,
    this.commonItem,
    this.categoryname,
    this.subcategoryName
  });

  factory SubCategoryItems.fromMap(Map<String, dynamic> data) {
    return SubCategoryItems(
      productRate: data['PRODUCT_RATE'] ?? '',
      averageRatings: data['Average_rating'] ?? '',
      totalReview: data['Total_review'] ?? '',
      nutritionsInfo: data['NUTRITIONS_INFO'] as String?,
      manufacturerName: data['MANUFACTURER_NAME'] as String?,
      productCode: data['PRODUCT_CODE'] as String?,
      isNutritionsInfo: data['IS_NUTRITIONS_INFO'] as String?,
      offerDescription: data['OFFER_DESCRIPTION'] as String?,
      imageUrl: data['IMAGE_URL'] as String?,
      tax2: data['TAX2'] as dynamic,
      tax1: data['TAX1'] as dynamic,
      soldBy: data['SOLD_BY'] as String?,
      isIngredientsInfo: data['IS_INGREDIENTS_INFO'] as String?,
      productMrp: data['PRODUCT_MRP'] ?? '',
      availableStockQuanty: data['AVAILABLE_STOCK_QUANTY'] as int?,
      discountValue: data['DISCOUNT_VALUE'] as int?,
      productName: data['PRODUCT_NAME'] as String?,
      tax6: data['TAX6'] as dynamic,
      tax5: data['TAX5'] as dynamic,
      discountType: data['DISCOUNT_TYPE'] as String?,
      tax4: data['TAX4'] as dynamic,
      tax3: data['TAX3'] as dynamic,
      isWishlist: data['IS_WISHLIST'] as int?,
      uom: data['UOM'] as String?,
      netWeight: data['NET_WEIGHT'] as String?,
      ingredientsInfo: data['INGREDIENTS_INFO'] as String?,
      isOfferItem: data['IS_OFFER_ITEM'] as String?,
      brandName: data['BRAND_NAME'] as String?,
      weighingFlag: data['WEIGHING_FLAG'] as String?,
      isFavoriteItem: data['IS_FAVORITE_ITEM'] as int?,
      commonItem: data['COMMON_ITEM'] as String?,
      categoryname: data['CATEGORY_NAME'] as String?,
      subcategoryName: data['DEPARTMENT_NAME'] as String?
    );
  }

  Map<String, dynamic> toMap() => {
        'PRODUCT_RATE': productRate,
        'Average_rating': averageRatings,
        'Total_review': totalReview,
        'NUTRITIONS_INFO': nutritionsInfo,
        'MANUFACTURER_NAME': manufacturerName,
        'PRODUCT_CODE': productCode,
        'IS_NUTRITIONS_INFO': isNutritionsInfo,
        'OFFER_DESCRIPTION': offerDescription,
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
        'IS_WISHLIST': isWishlist,
        'UOM': uom,
        'NET_WEIGHT': netWeight,
        'INGREDIENTS_INFO': ingredientsInfo,
        'IS_OFFER_ITEM': isOfferItem,
        'BRAND_NAME': brandName,
        'WEIGHING_FLAG': weighingFlag,
        'IS_FAVORITE_ITEM': isFavoriteItem,
        'COMMON_ITEM': commonItem,
        'DEPARTMENT_NAME': subcategoryName,
        'CATEGORY_NAME': categoryname
       

      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubCategoryItems].
  factory SubCategoryItems.fromJson(String data) {
    return SubCategoryItems.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubCategoryItems] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productRate,
      averageRatings,
      totalReview,
      nutritionsInfo,
      manufacturerName,
      productCode,
      isNutritionsInfo,
      offerDescription,
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
      isWishlist,
      uom,
      netWeight,
      ingredientsInfo,
      isOfferItem,
      brandName,
      weighingFlag,
      isFavoriteItem,
      commonItem,
      categoryname,
      subcategoryName
    ];
  }
}
