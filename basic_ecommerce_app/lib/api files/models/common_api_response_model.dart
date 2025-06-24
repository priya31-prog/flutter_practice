import 'package:basic_ecommerce_app/api%20files/models/error_response_model.dart';

class APIResponseModel<T> {
  final T? response;
  final ErrorResponse errorResponse;

  APIResponseModel({this.response, required this.errorResponse});
}
