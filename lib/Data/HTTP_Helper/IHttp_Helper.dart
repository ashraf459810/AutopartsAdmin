import 'package:admin/Core/AppExcepition.dart';
import 'package:admin/Data/HTTP_Helper/Http_Helper.dart';
import 'package:connectivity/connectivity.dart';

import 'package:http/http.dart' as http;

class IHttpHlper implements HttpHelper {
  final String baseUrl = "http://134.209.78.88:8080/autoparts";
  @override
  Future getrequest(String url) async {
    var responseJson;

    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        throw NoInternet("");
    }

    final response = await http.get(Uri.parse(baseUrl + url));
    print(response.statusCode);
    print("here from http $url");

    responseJson = returnResponse(response);

    return responseJson;
  }

  @override
  Future postrequest(String url) async {
    var responseJson;
    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        throw NoInternet("");
    }

    final response = await http.post(Uri.parse(baseUrl + url));
    print(response.statusCode);
    print("here from http $url");
    responseJson = returnResponse(response);

    return responseJson;
  }

  @override
  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseinjson = (response.body);

        return responseinjson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        print("error");
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NoInternet("Check your connection");
      case 500:
        throw InternalServerError(
            enternalServerErrorFromJson(response.body).message);

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
