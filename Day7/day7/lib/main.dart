import 'package:day7/state_model/CartStateModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/products_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CartStateModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Products App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductsPage(),
    );
  }
}
