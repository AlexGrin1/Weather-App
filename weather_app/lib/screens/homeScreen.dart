import '../imports.dart';

class HomeScreen extends StatelessWidget {
  var currentPosition;
  // var currentAddress;
  HomeScreen(this.currentPosition,{Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    MyProvider _state = Provider.of<MyProvider>(context);
    final _cityController = TextEditingController();
    return Scaffold(
      floatingActionButton: IconButton(onPressed:(){getWeatherLocation();}, icon:Icon(Icons.location_searching) ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.location_city)),
          Text('$currentPosition'),
          // Text('${currentAddress}'),
          TextFormField(
            controller: _cityController,
          ),
          ElevatedButton(
              onPressed: () {
                _state.changeUserCityValue(_cityController.text);
                Navigator.pushNamed(context, '/weather');
              },
              child: Text("Get Weather")),
        ],
      ),
    );
  }
  
}
