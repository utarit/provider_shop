import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/cartPage.dart';
import 'package:provider_shop/models/cartModel.dart';
import 'package:provider_shop/models/userModel.dart';
import 'package:provider_shop/productList.dart';
import 'package:provider_shop/productPage.dart';
import 'package:provider_shop/settingsPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Shop"),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Selector<UserModel, String>(
                builder: (context, username, child) {
                  return Text(username.isEmpty
                      ? "You can log in from settings page!"
                      : "Welcome $username");
                },
                selector: (context, model) => model.username),
          ),
          Container(
            height: 350,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(4),
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, i) {
                  var product = productList[i];
                  // print(product.name);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPage(
                                    product: product,
                                  )));
                    },
                    child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Hero(
                                tag: product.key,
                                child: Image.network(
                                  product.imageUrl,
                                  width: 250,
                                  height: 200,
                                )),
                            Text(product.name),
                            Text("\$${product.price}"),
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
                            )
                          ],
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
