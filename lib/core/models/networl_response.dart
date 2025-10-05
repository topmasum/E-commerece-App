class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final String? message;
  final Map<String, dynamic>? body;
  NetworkResponse({
    required this.isSuccess,
    this.body,
    required this.statusCode,
    this.message,
  });
}