class ErrorResponseException implements Exception {
  ErrorResponseException({
    required this.Success,
    required this.message,
  });

  final bool Success;
  final String message;
}

class ForgetErrorResponse implements Exception {
  ForgetErrorResponse({
    required this.status,
    required this.msg,
  });

  final bool status;
  final String? msg;
}

class ErrorResponseExcept implements Exception {
  ErrorResponseExcept({
    required this.Success,
    required this.message,
    this.member,
  });

  final bool Success;
  final String message;
  final String? member;
}

class ErrorException implements Exception {
  ErrorException({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;
}
