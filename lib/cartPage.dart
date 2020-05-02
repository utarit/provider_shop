import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/models/cartModel.dart';
import 'package:provider_shop/models/userModel.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var username = Provider.of<UserModel>(context).username;
    return Scaffold(
      appBar: AppBar(title: Text("${username.isEmpty ? "Someone" : username}'s Cart")),
      body: Container(
        child: Consumer<CartModel>(
          builder: (context, model, child) {
            if(model.cart.isEmpty) return Center(child: Text("Cart is Empty"),);

            return ListView.builder(
                itemCount: model.cart.length,
                itemBuilder: (context, i) {
                  var tuple = model.cart[i];
                  var product = tuple.product;
                  return ListTile(
                    leading: Image.network(product.imageUrl),
                    title: Text(product.name),
                    subtitle: Text("Price \$${product.price}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            model.decQuantity(product.key);
                          },
                        ),
                        Text("${tuple.quantity}"),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            model.incQuantity(product.key);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red,),
                          onPressed: () {
                            model.removeProduct(product.key);
                          },
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
