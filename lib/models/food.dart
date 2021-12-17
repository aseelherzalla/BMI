import 'package:flutter/material.dart';

class Food {
  String userId;
  String name;
  String category;
  double calory;
  String img;
  String unit;

  Food({
    @required this.userId,
    @required this.name,
    @required this.category,
    @required this.calory,
    @required this.img,
    @required this.unit,
  });

  Food.fromMap(Map map) {
    this.userId = map["userId"];
    this.name = map["name"];
    this.category = map["category"];
    this.calory = map["calory"];
    this.img = map["foodPhotoUrl"];
    this.unit = map["unit"];
  }

  toMap() {
    return {
      "userId": this.userId,
      "name": this.name,
      "category": this.category,
      "calory": this.calory,
      "foodPhotoUrl": this.img,
      "unit": this.unit,
    };
  }
}