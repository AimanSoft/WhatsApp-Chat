import 'package:flutter/material.dart';

class SettingModel extends ChangeNotifier {
  String _name = "Anas";
  String _imagePath = "assets/images/image_1.jpg";

  String getName() {
    return _name;
  }

  void updateName(String name) {
    _name = name;
  }

    String getImage() {
    return _imagePath;
  }
}
