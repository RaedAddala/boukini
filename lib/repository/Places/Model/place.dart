import 'package:json_annotation/json_annotation.dart';
part 'place.g.dart';

@JsonSerializable()
class Place {
  final String? name;
  final String? city;
  final String? district;
  final String? state;
  final String country;
  Place({
    this.name,
    this.city,
    this.district,
    this.state,
    required this.country,
  });
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
