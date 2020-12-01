import 'package:flutter/material.dart';

import '../model/product_model.dart';
import 'cart_page.dart';
import 'product_row.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Icon(Icons.shopping_cart),
            textColor: Colors.white,
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
              return ProductRow(productModelsData[index]);
            },
            itemCount: productModelsData.length,
          )),
    );
  }
}
