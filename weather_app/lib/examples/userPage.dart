import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("${arguments.firstName} ${arguments.lastName}"),
        // title: Text("${settings['firstName']} ${settings['lastName']}"),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      arguments.icon,
                      // settings['icon'],
                      size: 180,
                      color: Colors.indigo,
                    ),
                    Text(
                        'Your name : ${arguments.firstName} ${arguments.lastName}'),
                    // 'Your name : ${settings['firstName']} ${settings['lastName']}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Country : ${arguments.country}'),
                    // Text('Country : ${settings['country']}'),
                    SizedBox(
                      height: 10,
                    ),
                    arguments.email != null
                        ? Text("Your mail : ${arguments.email}")
                        : null!,
                    // Text("Your mail : ${settings['email']}"),
                    SizedBox(
                      height: 10,
                    ),
                    arguments.email != null
                        ? Text("Your phone: ${arguments.phone}")
                        : null!,

                    // Text("Your phone: ${settings['phone']}"),
                    SizedBox(
                      height: 10,
                    ),
                    // Text("Your password: ${settings.password}"),
                    // Text("Your password: ${settings['password']}"),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AccountScreen(
                          userData: arguments,
                        )));
                ;
              },
              child: Text("Confirm and create"),
            )
          ],
        ),
      ),
    );
  }
}
