import './imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   late Position _currentPosition;
  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProvider>.value(value: MyProvider()),
      ],
      child: MaterialApp(routes: {
        '/weather': (context) => WeatherScreen(),
      }, home: HomeScreen(_currentPosition)),
    );
  }
    _getCurrentLocation() {
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.low, forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
  }
}
