import 'dart:convert';

import 'package:http/http.dart'as http;
import '../home/modal/home_modal.dart';

class ApiHelper {
  Future<List<dynamic>> ApicCall() async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/products.php";

    Uri uri = Uri.parse(Link);

    var result = await http.get(uri);

    var json = jsonDecode(result.body);

    print(json);

    List<dynamic> productModel = json.map((e) => ProductModel().ProductFromJson(e),).toList();

    return productModel;
  }
  Future<String> apicall(String n1,String r1, String c1,String d1,String p1,String o1) async {
    String link="https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";
    Uri uri=Uri.parse(link);
    var json = await http.post(uri,body: {"product_name":n1,"product_price":p1,"product_offer":o1,"product_category":c1,"product_desc":d1,"product_rate":r1,});

    if(json.statusCode==200){
      return "succefully";
    }
    return "failled";



  }

}