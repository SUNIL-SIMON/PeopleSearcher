import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ServerRequestsHandler {
  Future<List<dynamic>> makeRequest(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw response;
    }
  }
  void makeImageRequest(String url,Function(Uint8List? image, dynamic? exception) onComplete) async{
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String? contentType = response.headers['content-type'];
      if (contentType != null && contentType.startsWith('image/')) {
        final bytes = response.bodyBytes;
        onComplete(bytes,null);
      } else {
        throw onComplete(null,'Seems something wrong with the Image.');
      }
    }
    else {
      throw onComplete(null,response);
    }
  }
}