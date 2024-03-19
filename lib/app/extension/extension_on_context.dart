import 'package:flutter/material.dart';

extension ExtensionOnContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  double get heightScreen => MediaQuery.of(this).size.height;
}
