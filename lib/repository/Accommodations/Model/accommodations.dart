import 'package:json_annotation/json_annotation.dart';
part 'accommodations.g.dart';

@JsonSerializable()
class Accommodations {
  final String name;
  final String category;
  final String location;
  final double price;
  final double rating;
  final String picture;
  final int stars;
  Accommodations({
    required this.name,
    required this.category,
    required this.location,
    required this.price,
    required this.rating,
    required this.picture,
    required this.stars,
  });
  factory Accommodations.fromJson(Map<String, dynamic> json) =>
      _$AccommodationsFromJson(json);
  Map<String, dynamic> toJson() => _$AccommodationsToJson(this);
}
