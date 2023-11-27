import 'dart:convert';

import 'package:equatable/equatable.dart';

class ScreenMessage extends Equatable {
  final String? popupMessage1;
  final String? popupMessage2;
  final String? footerMessage1;
  final String? footerMessage2;
  final String? screenMessage2;
  final String? screenMessage1;

  const ScreenMessage({
    this.popupMessage1,
    this.popupMessage2,
    this.footerMessage1,
    this.footerMessage2,
    this.screenMessage2,
    this.screenMessage1,
  });

  factory ScreenMessage.fromMap(Map<String, dynamic> data) => ScreenMessage(
        popupMessage1: data['popup_message_1'] as String?,
        popupMessage2: data['popup_message_2'] as String?,
        footerMessage1: data['footer_message_1'] as String?,
        footerMessage2: data['footer_message_2'] as String?,
        screenMessage2: data['screen_message_2'] as String?,
        screenMessage1: data['screen_message_1'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'popup_message_1': popupMessage1,
        'popup_message_2': popupMessage2,
        'footer_message_1': footerMessage1,
        'footer_message_2': footerMessage2,
        'screen_message_2': screenMessage2,
        'screen_message_1': screenMessage1,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ScreenMessage].
  factory ScreenMessage.fromJson(String data) {
    return ScreenMessage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ScreenMessage] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      popupMessage1,
      popupMessage2,
      footerMessage1,
      footerMessage2,
      screenMessage2,
      screenMessage1,
    ];
  }
}
