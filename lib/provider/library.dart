// import 'package:bible_bot/api/api.dart';
// import 'package:flutter/material.dart';
//
// class LibProvider with ChangeNotifier {
//   String id = Api.id;
//   String pw = Api.pw;
//   List<dynamic> data;
//
//   LibProvider() {
//     getlib(id, pw);
//   }
//
//   Future<Map<String, dynamic>> getlib(String id, String pw) async {
//     var respons = await Api().getlib(id,pw);
//     Libdata.fromjson(respons);
//     data = Libdata().data;
//     notifyListeners();
//     print(respons);
//   }
// } //
//
// class Libdata {
//   List<dynamic> data;
//   Libdata({this.data});
//   factory Libdata.fromjson(Map<String, dynamic> json) {
//     return new Libdata(
//       data: json['data']['body'],
//     );
//   }
// }
