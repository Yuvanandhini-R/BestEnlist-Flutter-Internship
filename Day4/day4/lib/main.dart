import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Page"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ProductRow(
                "images/rubiks_cube.jpg", "Rubik's Cube", "Twist Your Brain"),
          ],
        ),
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  const ProductRow(this.image, this.title, this.description, {Key key})
      : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  child: Container(
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                    width: 100,
                    height: 100,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(description)
                  ],
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
