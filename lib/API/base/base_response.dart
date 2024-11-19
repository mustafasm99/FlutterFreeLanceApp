class BaseResponse {
  bool status;
  Map<String , dynamic>? response;
  String message = '';

  BaseResponse({required this.status, this.response , this.message = ''});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json['success'],
      response: json['message'],
      message: json['message']
    );
  }
}