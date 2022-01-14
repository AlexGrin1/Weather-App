// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/import.dart';

// class AccountScreen extends StatefulWidget {
//   User userData;
//   AccountScreen({Key? key, required this.userData}) : super(key: key);

//   @override
//   _AccountScreenState createState() => _AccountScreenState(user: userData);
// }

// class _AccountScreenState extends State<AccountScreen> {
//   final User user;
//   _AccountScreenState({required this.user});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           children: [
//             Text("${user.firstName} ${user.lastName}"),
//             // Text("${user['firstName']} ${user['lastName']}"),
//             Text(
//               "${user.country} ${user.phone}",
//               // "${user['country']} ${user['phone']}",
//               style: TextStyle(fontSize: 12),
//             ),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(1.0),
//             child: Icon(user.icon),
//             // child: Icon(user["icon"]),
//           )
//         ],
//       ),
//     );
//   }
// }
