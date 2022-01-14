import '../imports.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<WeatherList> weather;

  @override
  void initState() {
    super.initState();
    weather = getWeather(context.read<MyProvider>().userCityValue);
  }

  @override
  Widget build(BuildContext context) {
    MyProvider _state = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_state.userCityValue),
      ),
      body: FutureBuilder<WeatherList>(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.weather?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text('Temp: ${snapshot.data?.weather?[0].main}'),
                      Text('Temp: ${snapshot.data?.main?.temp?.round()}'),
                      Text(
                          'Wind speed: ${snapshot.data?.wind?.speed?.round()}'),
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
