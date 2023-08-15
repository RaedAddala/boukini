import 'package:json_annotation/json_annotation.dart';
part 'place.g.dart';

@JsonSerializable()
class Place {
  String? name;
  String? city;
  String? district;
  String? state;
  String country;
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
