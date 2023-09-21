class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix $_message";
  }
}

class InternetException extends AppException {
  InternetException([String? message]) {
    AppException(message, "No Internet");
  }
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) {
    AppException(message, "Request Time Out");
  }
}

class ServerException extends AppException {
  ServerException([String? message]) {
    AppException(message, "Server Error");
  }
}

class DatabaseException extends AppException {
  DatabaseException([String? message]) {
    AppException(message, "Database Error");
  }
}

class InvalidUrl extends AppException {
  InvalidUrl([String? message]) {
    AppException(message, "Invalid Url");
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) {
    AppException(message, "Error Occured");
  }
}

class UnableToConvert extends AppException {
  UnableToConvert([String? message]) {
    AppException(message, "Error DataType");
  }
}
