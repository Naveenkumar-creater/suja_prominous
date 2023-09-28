import 'dart:async';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ApiConstant {
  static const String baseUrl =
      "http://192.168.29.131:8081/AtmaInterfaceAPI/wsservice";

  static const String fromDate = "2023-08-01 10:00:00";
  static const String clientId = "vijay";

  Future<dynamic> makeApiRequest({
    required String url,
    required Map<String, String> headers,
    required dynamic requestBody,
    Duration timeoutDuration = const Duration(seconds: 5),
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: headers,
            body: jsonEncode(requestBody),
          )
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(jsonDecode(response.body));
        return jsonDecode(response. body);
      }
    } on TimeoutException {
      throw ('Connection timed out. Please check your internet connection.');
    } catch (e) {
      throw (e);
    }
  }
}
