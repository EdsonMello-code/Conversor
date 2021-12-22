import 'package:flutter/material.dart';

class FormatProperty {
  MaterialStateProperty<T> call<T>(T property) {
    return MaterialStateProperty.all(property);
  }
}
