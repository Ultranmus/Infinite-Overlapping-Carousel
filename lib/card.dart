import 'package:flutter/cupertino.dart';

class CardModel {
  int id;
  double zIndex;
  final Widget? child;

  CardModel({required this.id, this.zIndex = 0.0, this.child});
}
