import 'package:flutter/material.dart';

class ItemsModel extends ChangeNotifier {
  List items = [];

  selectItem(int index) {
    items.add(index);
    notifyListeners();
  }
}
