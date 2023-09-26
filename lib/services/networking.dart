import 'package:http/http.dart' as https;
import 'dart:convert';

class Networkhelper{

  Networkhelper(this.url);

  final String url;

  Future getData() async {

    https.Response response =  await https.get(Uri.parse(url));
    String data = response.body;

    return jsonDecode(data);

  }
}