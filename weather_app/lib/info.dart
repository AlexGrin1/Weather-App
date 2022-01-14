import './imports.dart';

class MyProvider extends ChangeNotifier {
  String _userCity = "";
  String get userCityValue => _userCity;
  void changeUserCityValue(text) {
    _userCity = text;
  }
}
