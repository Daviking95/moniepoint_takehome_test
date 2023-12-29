part of 'package:peerlendly/core/network/exports.dart';

class NetworkService {
  static String baseUrl = F.baseUrl;
  static String token = AppPreferences.bearerToken;
  static Map<String, String> headers = {
    'Content-Type': 'application/json-patch+json',
    'Authorization': 'Bearer $token',
  };

  static refreshToken() {
    "bearerToken ${AppPreferences.bearerToken}".log();

    baseUrl = F.baseUrl;
    headers = {
      'Content-Type': 'application/json-patch+json',
      'Authorization': 'Bearer ${AppPreferences.bearerToken}',
    };
  }

  static Future<dynamic> get(
      {required String url, String? customBaseUrl}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    refreshToken();

    Uri uri = Uri.parse((customBaseUrl ?? baseUrl) + url);

    "getUri $uri".log();
    "getToken $token".log();

    try {
      http.Response response = await http.get(uri, headers: headers);

      "getResponseBody ${response.body}".log();
      "getResponseStatusCode ${response.statusCode}".log();

      switch (response.statusCode) {
        case 200:
        case 201:
          return response.body;
        default:
          throw response.body;
      }
    }  on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on HttpException catch (e) {
      throw HttpException(e.toString());
    }  on HandshakeException catch (e) {
      throw HandshakeException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> data,
      List<Map<String, dynamic>>? dataList,
      Map<String, String>? customHeader,
      String? customBaseUrl}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    refreshToken();

    Uri uri = Uri.parse((customBaseUrl ?? baseUrl) + url);

    "postUri $uri".log();
    "postToken $token $headers".log();
    try {
      http.Response response = await http.post(uri,
          body: jsonEncode(dataList ?? data), headers: customHeader ?? headers);

      "postResponseBody ${response.body}".log();
      "postResponseStatusCode ${response.statusCode}".log();

      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
          return response.body;
        default:
          throw response.body;
      }

    }  on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on HttpException catch (e) {
      throw HttpException(e.toString());
    }  on HandshakeException catch (e) {
      throw HandshakeException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postMultiPart(
      {required String url,
      required String name,
      dynamic bytes,
      required Map<String, String> customHeader}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    refreshToken();

    Uri uri = Uri.parse(baseUrl + url);

    "getUri $uri".log();
    "getToken $token $headers".log();
    try {
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('file', name));
      request.headers.addAll(customHeader);

      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      "statusCode ${response.statusCode}".log();
      "statusBody ${response.reasonPhrase}".log();

      switch (response.statusCode) {
        case 200:
        case 201:
          return responseBody.body;
        default:
          throw responseBody.body;
      }
    } on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on HttpException catch (e) {
      throw HttpException(e.toString());
    }  on HandshakeException catch (e) {
      throw HandshakeException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> patch(
      {required String url,
      required Map<String, dynamic> data,
      String? customBaseUrl}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    refreshToken();

    Uri uri = Uri.parse((customBaseUrl ?? baseUrl) + url);
    uri.log();
    try {
      http.Response response =
          await http.patch(uri, body: jsonEncode(data), headers: headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          return response.body;
        default:
          throw response.body;
      }
    }  on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on HttpException catch (e) {
      throw HttpException(e.toString());
    }  on HandshakeException catch (e) {
      throw HandshakeException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> data,
      String? customBaseUrl}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    refreshToken();

    Uri uri = Uri.parse((customBaseUrl ?? baseUrl) + url);
    uri.log();
    try {
      http.Response response =
          await http.put(uri, body: jsonEncode(data), headers: headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          return response.body;
        default:
          throw response.body;
      }
    }  on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on HttpException catch (e) {
      throw HttpException(e.toString());
    }  on HandshakeException catch (e) {
      throw HandshakeException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> delete(
      {required String url, required Map<String, dynamic> data}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    refreshToken();

    Uri uri = Uri.parse(baseUrl + url);
    uri.log();
    try {
      http.Response response =
          await http.delete(uri, body: jsonEncode(data), headers: headers);

      switch (response.statusCode) {
        case 200:
        case 201:
        case 202:
          return response.body;
        default:
          throw response.body;
      }
    }  on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on HttpException catch (e) {
      throw HttpException(e.toString());
    }  on HandshakeException catch (e) {
      throw HandshakeException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }



  static checkIfTokenHasExpiredOutsideDio() async {
    try {

      LoginRequestModel loginRequestModel = LoginRequestModel(
          emailAddress: AppPreferences.returnDetails, securityPin: AppPreferences.activityPin);

      final dartz.Either<ErrorResponseModel, GenericResponseModel>
      _responseData =
      await PLLoginRepository.instance.loginService(loginRequestModel);

      return _responseData.fold((errorResponse) {}, (successResponse) async{

        final dartz.Either<ErrorResponseModel, GetUserProfileResponseModel>
        _profileResponseData =
            await PLProfileRepository.instance.getUserProfileService();

        return _profileResponseData.fold((errorResponse) async {

        }, (successResponse) async {

          UserData.getUserProfileResponseModel = successResponse;
        });

      });
    }  on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on HttpException catch (e) {
      throw HttpException(e.toString());
    }  on HandshakeException catch (e) {
      throw HandshakeException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }
}
