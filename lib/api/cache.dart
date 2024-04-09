import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:random_color/api/color_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  Future<void> saveListColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    ColorDto? colorDto;
    final listColor = await getListColor();
    if (listColor.isEmpty) {
      colorDto = ColorDto(color: color, id: 0);
      listColor.add(colorDto);
    } else {
      colorDto = listColor.last;
      colorDto = ColorDto(color: color, id: colorDto.id! + 1);
      listColor.add(colorDto);
    }
    await prefs.setString('color', jsonEncode(listColor));
  }

  Future<void> removeListColor() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('color');
  }

  Future<List<ColorDto>> getListColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorString = prefs.getString('color');
    if(colorString == null) return [];
    final jsonColors = jsonDecode(colorString);
   final listColor = List<ColorDto>.from(jsonColors.map((x) => ColorDto.fromJson(x)));
    return listColor;
  }
}