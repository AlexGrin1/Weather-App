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
      body: Stack(children: [
//         Image.network(
        // 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.sat24.com%2Fen&psig=AOvVaw0lgfi2RsRejzX4fE386F0f&ust=1642250083715000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCICM776gsfUCFQAAAAAdAAAAABAD'),
        FutureBuilder<WeatherList>(
          future: weather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemExtent: 200,
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.forecast?.forecastday?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue[100],
                      margin: EdgeInsets.only(
                          top: 10, right: 40, bottom: 10, left: 40),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                          'https:${snapshot.data?.forecast?.forecastday?[index].day?.condition?.icon}'),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Card(
                                    color: Colors.amber,
                                    child: Column(
                                      children: [
                                        Text(
                                            'Wind: ${snapshot.data?.forecast?.forecastday?[index].day?.maxwindKph?.round()} kp/h'),
                                        Text(
                                            'Precipitation: ${snapshot.data?.forecast?.forecastday?[index].day?.avghumidity} %'),
                                      ],
                                    ),
                                  ),
                                  Text(
                                      'Humidity: ${snapshot.data?.forecast?.forecastday?[index].day?.dailyChanceOfRain} %'),
                                ],
                              ),
                            ]),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('Error');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ]),
    );
  }
}
