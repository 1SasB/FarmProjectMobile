import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getData() async {
    var innerUrl = Uri.parse(url);
    http.Response response = await http.get(innerUrl);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

  Future getDataWithHeaders(token) async {
    var innerUrl = Uri.parse(url);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'x-auth-token': token
    };
    http.Response response = await http.get(innerUrl, headers: requestHeaders);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> sendData(Map _data) async {
    var innerUrl = Uri.parse(url);
    Map<String, dynamic> result = {};
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    try {
      http.Response response = await http
          .post(
            innerUrl,
            headers: requestHeaders,
            body: jsonEncode(_data),
          )
          .timeout(Duration(seconds: 4));

      if (response.statusCode == 200) {
        result = {
          'user_token': response.headers['x-auth-token'],
          'status_code': response.statusCode
        };
        return result;
      } else {
        print(response.statusCode);
        result = {'status_code': response.statusCode};
        return result;
      }
    } catch (e) {
      print(e);
      return {'status_code': 404};
    }
  }
}
