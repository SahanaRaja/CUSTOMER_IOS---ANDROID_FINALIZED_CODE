import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final String? validTo;
  final int? value;
  final String? caption;
  final String? selectedType;

  const ServiceModel({
    this.validTo,
    this.value,
    this.caption,
    this.selectedType,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> data) => ServiceModel(
        validTo: data['valid_to'] as String?,
        value: data['Value'] as int?,
        caption: data['caption'] as String?,
        selectedType: data['selected_type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'valid_to': validTo,
        'Value': value,
        'caption': caption,
        'selected_type': selectedType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceModel].
  factory ServiceModel.fromJson(String data) {
    return ServiceModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [validTo, value, caption, selectedType];
}
