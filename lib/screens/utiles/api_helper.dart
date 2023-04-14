import 'dart:convert';

import 'package:http/http.dart' as http;
import '../home/modal/home_modal.dart';

class ApiHelper {
  Future<List<dynamic>> ApicCall() async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/products.php";

    Uri uri = Uri.parse(Link);

    var result = await http.get(uri);

    var json = jsonDecode(result.body);

    List<dynamic> productModel =
        json.map((e) => ProductModel().ProductFromJson(e)).toList();

    return productModel;
  }

  Future<bool> creatData(String p1,String p2, String p3,String  p4,String p5,String p6) async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";

    Uri uri = Uri.parse(Link);

    var result = await http.post(
      uri,
      body: {
        "p_name": p1,
        "p_rate": p2,
        "p_price": p3,
        "p_offer": p4,
        "p_desc": p5,
        "p_category": p6,
      },
    );

    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

}
