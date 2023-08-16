import 'package:json_annotation/json_annotation.dart';
part 'api_response.g.dart';

@JsonSerializable()

class ApiResponse {
  List<Map<String, dynamic>> features;
  ApiResponse({required this.features});
  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
