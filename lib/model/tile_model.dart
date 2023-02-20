import 'package:flutter/material.dart';

class TileModel {
  int id;
  String title;
  Icon icon;
  String imgPath;
  TileModel({
    required this.icon,
    required this.title,
    required this.imgPath,
    required this.id,
  });
}
