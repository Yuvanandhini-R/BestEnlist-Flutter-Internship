import 'package:day5/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductRow extends StatelessWidget {
  const ProductRow(this.productModel, {Key key}) : super(key: key);

  final ProductModel productModel;
// ClipRRect(
//                     child: Container(
//                       child: Image.asset(
//                         productModel.image,
//                         fit: BoxFit.cover,
//                       ),
//                       width: 100,
//                       height: 100,
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: Text(productModel.title),
                content: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(productModel.image),
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 150,
                              child: Text(productModel.longDescription)),
                          Text(
                            '₹' + productModel.price.toString(),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("OK"))
                ],
              );
            });
      },
      child: Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
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
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(productModel.shortDescription)
                    ],
                  ),
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
