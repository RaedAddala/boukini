// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accommodations _$AccommodationsFromJson(Map<String, dynamic> json) =>
    Accommodations(
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
      'name': instance.name,
      'category': instance.category,
      'location': instance.location,
      'price': instance.price,
      'rating': instance.rating,
      'picture': instance.picture,
      'stars': instance.stars,
    };
