import 'package:day7/state_model/CartStateModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Consumer<CartStateModel>(
          builder: (context, cartStateModel, child) {
            return cartStateModel.productModels.length != 0
                ? ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          CartRow(index),
                          if (cartStateModel.productModels.length == index + 1)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Total: ",
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "₹ ${cartStateModel.totalPrice()}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Center(child: Text("Tap a row to delete."))
                              ],
                            )
                        ],
                      );
                    },
                    itemCount: cartStateModel.productModels.length,
                  )
                : Center(
                    child: Text("Add Some Products To Cart!"),
                  );
          },
        ),
      ),
    );
  }
}

class CartRow extends StatefulWidget {
  const CartRow(this.index, {Key key}) : super(key: key);

  final int index;

  @override
  State<StatefulWidget> createState() => _CartRowState();
}

class _CartRowState extends State<CartRow> {
  double _currentOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.easeIn,
      opacity: _currentOpacity,
      duration: Duration(seconds: 1),
      child: Consumer<CartStateModel>(
        builder: (context, cartStateModel, child) => GestureDetector(
          onTap: () {
            setState(() {
              _currentOpacity = 0;
            });

            Future.delayed(Duration(seconds: 2), () {
              cartStateModel
                  .delete(cartStateModel.productModels[widget.index].id);

              setState(() {
                _currentOpacity = 1;
              });
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
                            cartStateModel.productModels[widget.index].image,
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
                            cartStateModel.productModels[widget.index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Container(
                            width: 125,
                            child: Text(
                              cartStateModel
                                  .productModels[widget.index].shortDescription,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "₹ ${cartStateModel.productModels[widget.index].price}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    )
                  ],
                ),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
