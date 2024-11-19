class BaseErrorResponse {
  final String message;
  final int code;

  BaseErrorResponse({required this.message,required this.code});

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) {
    return BaseErrorResponse(
      message: json['message'],
      code: json['code'],
    );
  }
}