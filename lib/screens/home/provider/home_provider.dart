
import 'package:flutter/material.dart';
import 'package:product_get_post_api/screens/home/modal/home_modal.dart';

import '../../utiles/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  List<dynamic> product = [];

  Future<List<dynamic>> ProductApiCall() async {
    ApiHelper apiHelper = ApiHelper();
    List<dynamic> productModel1 = await apiHelper.ApicCall();
    product = productModel1;
    return product;
  }
  Future<String> Chenge(String name,String rate,String category,String description,String price,String offer) async {
    ApiHelper apiHelper=ApiHelper();
    String msg = await apiHelper.apicall(name, rate,category,offer,description,price);
    return msg;

  }
}