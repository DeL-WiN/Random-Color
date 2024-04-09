import 'package:flutter/cupertino.dart';

class ColorDto {
  final int? id;
  final Color? color;

  ColorDto({this.color, this.id});

  ColorDto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        color = Color(json['color']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'color': color!.value,
  };
}
