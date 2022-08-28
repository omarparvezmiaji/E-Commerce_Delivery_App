import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'modelClass/api_request/order_model.dart';

class RemoteService {


  var _baseUrl = 'https://appsafwahmart.hotelsetting.com/api/delivery-app';

  Future getOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token=  prefs.getString("token");
    print("Get order token ------- $token");
    var client = http.Client();
    var uri = Uri.parse("$_baseUrl/get-orders-by-delivery-man/7");
    var response = await client.get(uri,
        headers: {

          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }


    );
    print("Status code is -----------${response.statusCode}");
    if (response.statusCode == 200) {
      var json = response.body;
      return orderResponseFromJson(json);
    }
  }
}
