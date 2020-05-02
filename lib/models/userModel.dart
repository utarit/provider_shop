import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String username = "";

  void login(String name){
    username = name;
    notifyListeners();
  }

  void logout(){
    username = "";
    notifyListeners();
  }
}