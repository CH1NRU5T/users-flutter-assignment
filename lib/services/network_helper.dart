import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<http.Response> getRequest({url}) {
    return http.get(Uri.parse(url));
  }
}
