import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            ),
            Consumer<CartModel>(builder: (context, model, child){
              var count = model.howManyInCart(product.key);
              if(count > 0) {
                return Text("You have $count of this product.");
              }

              return SizedBox.shrink();
            }),
            RaisedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false)
                    .addProduct(product);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Added to the Cart!"),
                  duration: Duration(seconds: 1),
                ));
              },
              child: Text("Add Cart!"),
              color: Theme.of(context).accentColor,
            ),
            SizedBox(height: 20)
          ],
        )),
      ),
    );
  }
}
