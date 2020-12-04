import 'package:day8/helper/RandomNumberGenerator.dart';
import 'package:day8/model/product_model.dart';
import 'package:day8/state_model/CartStateModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage(this.productModel, {Key key}) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.title),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            Hero(
              tag: 'product_image_${productModel.title}',
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  child: Image.asset(
                    productModel.image,
                    fit: BoxFit.cover,
                  ),
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          productModel.shortDescription,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "₹ ${productModel.price}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 275,
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                productModel.longDescription,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Consumer<CartStateModel>(
                builder: (context, cartStateModel, child) => RaisedButton(
                  onPressed: () {
                    cartStateModel.add(productModel);
                    Navigator.pop(context);
                  },
                  child: Text("Add to Cart"),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            "Random Numbers",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        for (int i = 0; i < 10; i++)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                ListTile(
                    title: Text(
                        "${RandomNumberGenerator().generateRandomNumberUpto100()}")),
                Divider()
              ],
            ),
          )
      ]),
    );
  }
}
