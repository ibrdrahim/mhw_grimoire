import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://mhw-db.com";

class API {
  static Future getMonsters() {
    var url = baseUrl + "/monsters?q={\"type\":\"large\"}";
    print(url);
    return http.get(url);
  }
}

