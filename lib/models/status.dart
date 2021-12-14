import 'package:flutter/material.dart';

class Status {
  String userId;
  double height;
  double weight;
  String date;
  String time;
  Status({
    @required this.userId,
    @required this.height,
    @required this.weight,
    @required this.date,
    @required this.time,
  });

  Status.fromMap(Map map) {
    this.userId = map["userId"];
    this.height = map["height"];
    this.weight = map["weight"];
    this.date = map["date"];
    this.time = map["time"];
  }

  toMap() {
    return {
      "userId": this.userId,
      "height": this.height,
      "weight": this.weight,
      "date": this.date,
      "time": this.time,
    };
  }
}