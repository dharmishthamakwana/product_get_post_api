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
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {

              List<dynamic>? productModel = snapshot.data;

              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.blueGrey.shade100,
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            "${homeProviderFalse!.product[index].p_image}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title:  Text(
                          "${homeProviderFalse!.product[index].p_name}",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("rate  : ${homeProviderFalse!.product[index].p_rate}"),
                            Text("price  :${homeProviderFalse!.product[index].p_price}"),

                          ],
                        ),
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
                itemCount: homeProviderTrue!.product.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

