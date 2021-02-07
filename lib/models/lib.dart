import 'dart:convert';
import 'package:bible_bot/screens/body_screens/home_screens/lib.dart';

class Library {
  final List<dynamic> libdata;
  final String img;
  final int width;
  final int height;
  Library({this.libdata, this.height, this.img, this.width});

  factory Library.fromJson(
    Map<String, dynamic> json,
  ) {
    //json = jsonDecode(json['data'])['data'];
    return new Library(
      libdata: json['data'],
      //img: json['data']['body'],
    );
  }
}
