import 'dart:convert';

import 'package:equatable/equatable.dart';

class Base64Image extends Equatable {
  final String? imageName;
  final int? imageId;
  final String? imageBase64;

  const Base64Image({this.imageName, this.imageId, this.imageBase64});

  factory Base64Image.fromMap(Map<String, dynamic> data) => Base64Image(
        imageName: data['ImageName'] as String?,
        imageId: data['ImageId'] as int?,
        imageBase64: data['Image_Base64'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'ImageName': imageName,
        'ImageId': imageId,
        'Image_Base64': imageBase64,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Base64Image].
  factory Base64Image.fromJson(String data) {
    return Base64Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Base64Image] to a JSON string.
  String toJson() => json.encode(toMap());

  Base64Image copyWith({
    String? imageName,
    int? imageId,
    String? imageBase64,
  }) {
    return Base64Image(
      imageName: imageName ?? this.imageName,
      imageId: imageId ?? this.imageId,
      imageBase64: imageBase64 ?? this.imageBase64,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [imageName, imageId, imageBase64];
}
