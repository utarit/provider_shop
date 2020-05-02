import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/HomePage.dart';
import 'package:provider_shop/models/cartModel.dart';
import 'package:provider_shop/models/userModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          
        ),
        home: HomePage(),
      ),
    );
  }
}
