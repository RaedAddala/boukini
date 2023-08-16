import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../Model/api_response.dart';
part 'geolocation_api.g.dart';

@RestApi(baseUrl: "https://api.geoapify.com/v1/geocode/")
abstract class GeoApiClient {
  factory GeoApiClient(Dio dio) {
    dio.options = BaseOptions(
      contentType: "application/json",
      persistentConnection: true,
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return _GeoApiClient(dio);
  }
  @GET('/autocomplete?text={input}&apiKey={key}')
  Future<ApiResponse> getSuggestionsResponse(
    @Path("input") String txt,
    @Path("key") String key,
  );
}
