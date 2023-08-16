import 'package:dio/dio.dart';
import 'package:hotel_booking/env/env.dart';

import 'Model/place.dart';
import 'Retrofit/geolocation_api.dart';

class PlaceRepository {
  static final _client = GeoApiClient(Dio());
  static Future<List<Place>> getSuggestions(String txt) async {
    return (await _client.getSuggestionsResponse(txt, Env.geoApifyKey))
        .features
        .map(
          (e) => Place(
            country: e["properties"]["country"],
            name: e["properties"]["name"],
            city: e["properties"]["city"],
            district: e["properties"]["district"],
            state: e["properties"]["state"],
          ),
        )
        .toList();
  }
}
