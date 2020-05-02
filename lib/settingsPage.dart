import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/models/userModel.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = Provider.of<UserModel>(context, listen: false).username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Change Username"),
              TextField(
                controller: controller,
              ),
              RaisedButton(child: Text("Login"), color: Colors.blue, onPressed: () {
                Provider.of<UserModel>(context, listen: false).login(controller.text);
                Navigator.pop(context);
              }),
              RaisedButton(child: Text("Logout"), color: Colors.red, onPressed: () {
                Provider.of<UserModel>(context, listen: false).logout();
                controller.clear();
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
