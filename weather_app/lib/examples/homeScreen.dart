// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/import.dart';
// import 'package:http/http.dart' as http;
// import 'dart:core';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late dynamic newData = "Ожидаем ответ с сервера";
//   @override
//   void initState() {
//     loadData();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/loginScreen');
//                   },
//                   child: Text(
//                     'Create Account',
//                     style: TextStyle(fontSize: 20),
//                   )),
//               Text(newData)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<http.Response> getData() async {
//     Duration(seconds: 7);
//     const url = "https://about.google/static/data/locations.json";
//     return await http.get(Uri.parse(url));
//   }

//   void loadData() {
//     getData().then((response) {
//       if (response.statusCode == 200) {
//         setState(() {
//           newData = response.body;
//         });
//         // newData = response.body;
//       } else {
//         print(response.statusCode);
//       }
//     }).catchError(((error) {
//       debugPrint(error.toString());
//     }));
//   }
// }
