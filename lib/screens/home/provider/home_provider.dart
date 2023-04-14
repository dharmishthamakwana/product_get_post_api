import 'package:flutter/material.dart';
import 'package:product_get_post_api/screens/home/modal/home_modal.dart';

import '../../utiles/api_helper.dart';

class HomeProvider extends ChangeNotifier {
  List<dynamic> product = [];

  Future<List<dynamic>> ProductApiCall() async {
    ApiHelper apiHelper = ApiHelper();
    List<dynamic> productModel1 = await apiHelper.ApicCall();
    product = productModel1;
    return product;
  }

  Future<void> PostApiCall(p_name,p_rate,p_offer,p_desc,p_cate,p_price) async {
    ApiHelper apiHelper = ApiHelper();
    bool data = await apiHelper.creatData(p_name,p_rate,p_cate,p_desc,p_offer,p_price);
    notifyListeners();
    if(data == true)
    {
      print("Success");
    }
    else
    {
      print("Fail");
    }
  }
}
