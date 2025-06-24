class ErrorResponse {
  final String status;
  final String statusCode;
  final Map<String, List<String>> errorDescription;

  ErrorResponse({
    required this.status,
    required this.statusCode,
    required this.errorDescription,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      status: json['status'],
      statusCode: json['status_code'],
      errorDescription: Map<String, List<String>>.from(
        json['error_des'].map(
          (key, value) => MapEntry(key, List<String>.from(value)),
        ),
      ),
    );
  }
}
