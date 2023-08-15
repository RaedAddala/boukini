import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../Model/place.dart';
part 'geolocation_api.g.dart';

@RestApi(baseUrl: "https://api.geoapify.com/v1/geocode/")
abstract class GeoApiClient {
  factory GeoApiClient(Dio dio) = _ApiClient;
  @GET('/autocomplete?text={input}&apiKey={key}')
  Future<List<Place>> getSuggestions(
    @Path("input") String txt,
    @Path("key") String key,
  );
}
