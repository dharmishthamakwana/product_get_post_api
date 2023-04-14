import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).ProductApiCall();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Product Detailes")),
        body: FutureBuilder(
          future: homeProviderFalse!.ProductApiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(
                  "===========================================================================${snapshot.error}");
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<dynamic>? productModel = snapshot.data;

              return ListView.builder(
                itemCount: productModel!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue.shade50,
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Text(
                            "${homeProviderFalse!.product[index].p_image}",

                          ),
                        ),
                        title:  Text(
                          "${homeProviderFalse!.product[index].p_name}",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("price  :${homeProviderFalse!.product[index].p_rate}"),
                        trailing: Column(
                          children: [
                            Text("${homeProviderFalse!.product[index].p_offer}"),
                            Text("${homeProviderFalse!.product[index].p_desc}"),

                          ],
                        ),
                      ),
                    ),
                  );

                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
