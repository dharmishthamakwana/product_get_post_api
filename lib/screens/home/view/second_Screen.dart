import 'package:flutter/material.dart';
import 'package:product_get_post_api/screens/home/modal/home_modal.dart';
import 'package:product_get_post_api/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtrate = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtcate = TextEditingController();
  List<ProductModel> Alldata = [];
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: Text("Product Get&Post API"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                      label: Text("Enter your name"),
                      enabled: true,
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtrate,
                  decoration: InputDecoration(
                      label: Text("Enter the rate"),
                      enabled: true,
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtoffer,
                  decoration: InputDecoration(
                      label: Text("Enter the offer"),
                      enabled: true,
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtprice,
                  decoration: InputDecoration(
                    label: Text("Enter the price"),
                    enabled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtdesc,
                  decoration: InputDecoration(
                    label: Text("Enter the description"),
                    enabled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtcate,
                  decoration: InputDecoration(
                      label: Text("Enter the category "),
                      enabled: true,
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  String name = txtname.text;
                  String rate = txtrate.text;
                  String category = txtcate.text;
                  String description = txtdesc.text;
                  String price = txtprice.text;
                  String offer = txtoffer.text;
                  ProductModel p1 = ProductModel(
                      p_category: category,
                      p_desc: description,
                      p_name: name,
                      p_offer: offer,
                      p_price: price,
                      p_rate: rate);
                  Alldata.add(p1);
                  homeProviderFalse!.PostApiCall(
                      name, price, description, category, rate, offer);
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "home");
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
