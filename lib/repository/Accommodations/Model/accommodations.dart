import 'package:json_annotation/json_annotation.dart';
part 'accommodations.g.dart';

@JsonSerializable()
class Accommodations {
  final int id;
  final String name;
  final String category;
  final String location;
  final double price;
  final double rating;
  final String picture;
  final int stars;
  Accommodations({
    required this.id,
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

@JsonSerializable()
class AccommodationDetails {
  final int id;
  final String name;
  final String category;
  final String location;
  final String country;
  final int nbOfReviews;
  final String description;

  final double price;
  final double rating;
  final String picture;
  final int stars;
  AccommodationDetails({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.country,
    required this.price,
    required this.rating,
    required this.picture,
    required this.stars,
    required this.nbOfReviews,
    required this.description,
  });
  factory AccommodationDetails.fromJson(Map<String, dynamic> json) =>
      _$AccommodationDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AccommodationDetailsToJson(this);
}
