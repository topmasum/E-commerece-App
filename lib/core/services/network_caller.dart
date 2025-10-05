import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../models/networl_response.dart';



class Networkcaller {
   final String _deferror = 'Something went wrong';
   final String _unauthorizederror = 'Unauthorized';
   final VoidCallback onUnAuthorize;
   final String accessToken;
   final Logger _logger= Logger();

  Networkcaller({required this.onUnAuthorize,required this.accessToken});

   Future<NetworkResponse> getRequest({required String url}) async {
    Uri uri = Uri.parse(url);
    final Map<String, String> headers = {
      'token': accessToken,
    };
    _logrequest(url, null,headers);
    Response response = await get(uri, headers: headers);
    _logresponse(url, response);
    try {
      if (response.statusCode == 200) {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          message: _unauthorizederror,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          message: decodedjson['error'] ?? _deferror,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        message: _deferror,
      );
    }
  }

   Future<NetworkResponse> postRequest({
    required String url,
    required Map<String, String> body,
    bool isFormlogin = false,
    bool useToken = true, // <-- NEW PARAMETER
  }) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      if (useToken) 'token': accessToken, // Add token conditionally
    };

    Uri uri = Uri.parse(url);
    _logrequest(url, body, headers);
    Response response = await post(
      uri,
      headers: headers,
      body: jsonEncode(body),
    );
    _logresponse(url, response);

    try {
      if (response.statusCode == 200) {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else if (response.statusCode == 401) {
        if (isFormlogin) {
          onUnAuthorize();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          message: _unauthorizederror,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          message: decodedjson['data'] ?? decodedjson['error'] ?? _deferror, // more flexible
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        message: _deferror,
      );
    }
  }
   Future<NetworkResponse> patchRequest({
     required String url,
     required Map<String, String> body,
     bool isFormlogin = false,
     bool useToken = true, // <-- NEW PARAMETER
   }) async {
     final Map<String, String> headers = {
       'Content-Type': 'application/json',
       if (useToken) 'token': accessToken, // Add token conditionally
     };

     Uri uri = Uri.parse(url);
     _logrequest(url, body, headers);
     Response response = await patch(
       uri,
       headers: headers,
       body: jsonEncode(body),
     );
     _logresponse(url, response);

     try {
       if (response.statusCode == 200) {
         final decodedjson = jsonDecode(response.body);
         return NetworkResponse(
           isSuccess: true,
           statusCode: response.statusCode,
           body: decodedjson,
         );
       } else if (response.statusCode == 401) {
         if (isFormlogin) {
           onUnAuthorize();
         }
         return NetworkResponse(
           isSuccess: false,
           statusCode: response.statusCode,
           message: _unauthorizederror,
         );
       } else {
         final decodedjson = jsonDecode(response.body);
         return NetworkResponse(
           isSuccess: false,
           statusCode: response.statusCode,
           message: decodedjson['data'] ?? decodedjson['error'] ?? _deferror, // more flexible
         );
       }
     } catch (e) {
       return NetworkResponse(
         isSuccess: false,
         statusCode: -1,
         message: _deferror,
       );
     }
   }
   Future<NetworkResponse> putRequest({
     required String url,
     required Map<String, String> body,
     bool isFormlogin = false,
     bool useToken = true, // <-- NEW PARAMETER
   }) async {
     final Map<String, String> headers = {
       'Content-Type': 'application/json',
       if (useToken) 'token': accessToken, // Add token conditionally
     };

     Uri uri = Uri.parse(url);
     _logrequest(url, body, headers);
     Response response = await put(
       uri,
       headers: headers,
       body: jsonEncode(body),
     );
     _logresponse(url, response);

     try {
       if (response.statusCode == 200) {
         final decodedjson = jsonDecode(response.body);
         return NetworkResponse(
           isSuccess: true,
           statusCode: response.statusCode,
           body: decodedjson,
         );
       } else if (response.statusCode == 401) {
         if (isFormlogin) {
           onUnAuthorize();
         }
         return NetworkResponse(
           isSuccess: false,
           statusCode: response.statusCode,
           message: _unauthorizederror,
         );
       } else {
         final decodedjson = jsonDecode(response.body);
         return NetworkResponse(
           isSuccess: false,
           statusCode: response.statusCode,
           message: decodedjson['data'] ?? decodedjson['error'] ?? _deferror, // more flexible
         );
       }
     } catch (e) {
       return NetworkResponse(
         isSuccess: false,
         statusCode: -1,
         message: _deferror,
       );
     }
   }
   Future<NetworkResponse> deleteRequest({
     required String url,
     required Map<String, String> body,
     bool isFormlogin = false,
     bool useToken = true, // <-- NEW PARAMETER
   }) async {
     final Map<String, String> headers = {
       'Content-Type': 'application/json',
       if (useToken) 'token': accessToken, // Add token conditionally
     };

     Uri uri = Uri.parse(url);
     _logrequest(url, body, headers);
     Response response = await delete(
       uri,
       headers: headers,
       body: jsonEncode(body),
     );
     _logresponse(url, response);

     try {
       if (response.statusCode == 200) {
         final decodedjson = jsonDecode(response.body);
         return NetworkResponse(
           isSuccess: true,
           statusCode: response.statusCode,
           body: decodedjson,
         );
       } else if (response.statusCode == 401) {
         if (isFormlogin) {
           onUnAuthorize();
         }
         return NetworkResponse(
           isSuccess: false,
           statusCode: response.statusCode,
           message: _unauthorizederror,
         );
       } else {
         final decodedjson = jsonDecode(response.body);
         return NetworkResponse(
           isSuccess: false,
           statusCode: response.statusCode,
           message: decodedjson['data'] ?? decodedjson['error'] ?? _deferror, // more flexible
         );
       }
     } catch (e) {
       return NetworkResponse(
         isSuccess: false,
         statusCode: -1,
         message: _deferror,
       );
     }
   }


   void _logrequest(
      String url,
      Map<String, String>? body,
      Map<String, String>? headers,
      ) {
    _logger.i(
      '================REQUEST====================\n'
          'url:$url'
          'BODY:$body'
          'HEADERS:$headers'
          '================================================\n',
    );
  }

  void _logresponse(String url, Response response) {
    _logger.i(
      '===============RESPONSE=====================\n'
          'url:$url'
          'STATUS CODE:${response.statusCode}'
          'BODY:${response.body}'
          '================================================\n',
    );
  }
}