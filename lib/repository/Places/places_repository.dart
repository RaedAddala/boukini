import 'package:dio/dio.dart';

import 'Retrofit/geolocation_api.dart';

class PlaceRepository {
  final client = GeoApiClient(Dio(BaseOptions(
    contentType: "application/json",
    persistentConnection: true,
  )));
}
