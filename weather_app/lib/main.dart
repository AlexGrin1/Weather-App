import './imports.dart';
import 'package:geocoding/geocoding.dart';

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
  //  late String _currentAddress;
  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
    // _getAddressFromLatLng();
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
  //   _getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       _currentPosition.latitude,
  //       _currentPosition.longitude
  //     );

  //     Placemark place = placemarks[0];

  //     setState(() {
  //       _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
