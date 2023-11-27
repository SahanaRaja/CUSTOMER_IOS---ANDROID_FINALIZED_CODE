import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'review_desc.dart';

class Status extends Equatable {
  final double? averageRating;
  final String? message;
  final int? totalReview;
  final String? reviewInstructions;
  final List<ReviewDesc>? reviewDesc;
  final int? result;

  const Status({
    this.averageRating,
    this.message,
    this.totalReview,
    this.reviewInstructions,
    this.reviewDesc,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        averageRating: (data['Average_rating'] as num?)?.toDouble(),
        message: data['Message'] as String?,
        totalReview: data['Total_review'] as int?,
        reviewInstructions: data['review_instructions'] as String?,
        reviewDesc: (data['review_desc'] as List<dynamic>?)
            ?.map((e) => ReviewDesc.fromMap(e as Map<String, dynamic>))
            .toList(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Average_rating': averageRating,
        'Message': message,
        'Total_review': totalReview,
        'review_instructions': reviewInstructions,
        'review_desc': reviewDesc?.map((e) => e.toMap()).toList(),
        'Result': result,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Status].
  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Status] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      averageRating,
      message,
      totalReview,
      reviewInstructions,
      reviewDesc,
      result,
    ];
  }
}
