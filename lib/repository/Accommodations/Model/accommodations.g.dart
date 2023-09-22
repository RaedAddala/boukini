// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accommodations _$AccommodationsFromJson(Map<String, dynamic> json) =>
    Accommodations(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      picture: json['picture'] as String,
      stars: json['stars'] as int,
    );

Map<String, dynamic> _$AccommodationsToJson(Accommodations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'location': instance.location,
      'price': instance.price,
      'rating': instance.rating,
      'picture': instance.picture,
      'stars': instance.stars,
    };

AccommodationDetails _$AccommodationDetailsFromJson(
        Map<String, dynamic> json) =>
    AccommodationDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      country: json['country'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      picture: json['picture'] as String,
      stars: json['stars'] as int,
      nbOfReviews: json['nbOfReviews'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$AccommodationDetailsToJson(
        AccommodationDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'location': instance.location,
      'country': instance.country,
      'nbOfReviews': instance.nbOfReviews,
      'description': instance.description,
      'price': instance.price,
      'rating': instance.rating,
      'picture': instance.picture,
      'stars': instance.stars,
    };
