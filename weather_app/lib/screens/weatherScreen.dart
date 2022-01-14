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
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(_state.userCityValue),
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<WeatherList>(
            future: weather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CurentWeather(snapshot.data?.current),
                    Container(child: FutureWeather(snapshot))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error');
              }
              return Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}

class CurentWeather extends StatelessWidget {
  var snapshot;
  CurentWeather(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https:${snapshot.condition?.icon}',
                        scale: 0.8,
                      ),
                      Text('${snapshot?.condition?.text}'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      '${snapshot?.tempC?.round()} \u2103',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
    ;
  }
}

class FutureWeather extends StatelessWidget {
  var snapshot;
  FutureWeather(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemExtent: 200,
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        itemCount: snapshot.data?.forecast?.forecastday?.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue[100],
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${snapshot.data?.forecast?.forecastday?[index].date}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https:${snapshot.data?.forecast?.forecastday?[index].day?.condition?.icon}',
                              scale: 0.8,
                            ),
                            Text(
                                '${snapshot.data?.forecast?.forecastday?[index].day?.condition?.text}'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            '${snapshot.data?.forecast?.forecastday?[index].day?.maxtempC?.round()} \u2103',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                                'Wind: ${snapshot.data?.forecast?.forecastday?[index].day?.maxwindKph?.round()} kp/h'),
                            Text(
                                'Precipitation: ${snapshot.data?.forecast?.forecastday?[index].day?.avghumidity} %'),
                          ],
                        ),
                        Text(
                            'Humidity: ${snapshot.data?.forecast?.forecastday?[index].day?.dailyChanceOfRain} %'),
                      ],
                    ),
                  ]),
            ),
          );
        });
  }
}
