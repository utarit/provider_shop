import 'package:flutter/material.dart';
import 'package:provider_shop/models/cartModel.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Page")),
      body: SingleChildScrollView(
              child: Container(
            child: Column(
          children: [
            Hero(
              tag: product.key,
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 20),
            ),
            Text("\$${product.price}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.description),
            )
          ],
        )),
      ),
    );
  }
}
