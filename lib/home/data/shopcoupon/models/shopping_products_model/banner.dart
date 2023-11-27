import 'dart:convert';

import 'package:equatable/equatable.dart';



class Banners extends Equatable {
  final String? timeswapper;
  final String? isvedio;
  final String? url;

  const Banners({this.timeswapper, this.isvedio, this.url});

  factory Banners.fromMap(Map<String, dynamic> data) => Banners(
      timeswapper: data['time_swapper'] as String?,
      isvedio: data['is_video'] as String?,
      url: (data['Url'] as String?));

  Map<String, dynamic> toMap() => {
        'time_swapper': timeswapper,
        'is_video': isvedio,
        'Url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Banners.fromJson(String data) {
    return Banners.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [timeswapper, isvedio, url];
}
