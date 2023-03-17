import 'package:flutter/material.dart';

class Loading with ChangeNotifier {
  bool _status = false;

  bool get status => _status;

  void changeStatus({required bool status}) {
    _status = status;
    notifyListeners();
  }
}
