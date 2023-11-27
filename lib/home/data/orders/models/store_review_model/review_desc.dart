import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewDesc extends Equatable {
  final int? reviewId;
  final String? reviewRemarks;
  final int? rating;
  final String? reviewName;
  final String? reviewDone;

  const ReviewDesc({
    this.reviewId,
    this.reviewRemarks,
    this.rating,
    this.reviewName,
    this.reviewDone,
  });

  factory ReviewDesc.fromMap(Map<String, dynamic> data) => ReviewDesc(
        reviewId: data['review_id'] as int?,
        reviewRemarks: data['review_remarks'] as String?,
        rating: data['rating'] as int?,
        reviewName: data['review_name'] as String?,
        reviewDone: data['review_done'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'review_id': reviewId,
        'review_remarks': reviewRemarks,
        'rating': rating,
        'review_name': reviewName,
        'review_done': reviewDone,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReviewDesc].
  factory ReviewDesc.fromJson(String data) {
    return ReviewDesc.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReviewDesc] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      reviewId,
      reviewRemarks,
      rating,
      reviewName,
      reviewDone,
    ];
  }
}
