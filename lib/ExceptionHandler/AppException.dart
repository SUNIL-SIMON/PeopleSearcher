import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

class AppException implements Exception {
  final dynamic? exception;
  String alertmessage = "";

  AppException.handleException(this.exception, String? message){
    if(exception == null && message == null) {
      alertmessage = "An unexpected error occurred.";
    }
    else if(exception == null)
    {
      alertmessage = message!!;
    }
    else{
      if(exception is Response)
      {
        alertmessage = _handleHttpError(exception.statusCode);
      }
      else {
        alertmessage = _handleGeneralException(exception);
      }
    }
    // log(alertmessage);
  }

  static String _handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request: The server could not understand the request.";
      case 401:
        return "Unauthorized: Access is denied due to invalid credentials.";
      case 403:
        return "Forbidden: You don't have permission to access this resource.";
      case 404:
        return "Not Found: The requested resource could not be found.";
      case 500:
        return "Internal Server Error: Something went wrong on the server.";
      case 502:
        return "Bad Gateway: The server received an invalid response.";
      case 503:
        return "Service Unavailable: The server is temporarily unavailable.";
      default:
        return "An unexpected HTTP error occurred.";
    }
  }

  static String _handleGeneralException(dynamic exception) {
    if (exception is FormatException) {
      return "Serialization Error: Invalid format.";
    } else if (exception is TimeoutException) {
      return "Network Error: The request timed out.";
    } else if (exception is SocketException) {
      return "Network Error: Unable to connect to the internet.";
    } else {
      return exception.toString();
    }
  }

}