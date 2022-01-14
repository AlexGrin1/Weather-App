import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hidePassword = true;

  List<String> _countries = ["Russia", "Belarus", "Ukraine", "Poland"];
  List<IconData> _iconsUser = [
    Icons.person,
    Icons.person_outline,
    Icons.person_pin_circle_outlined,
    Icons.person_pin_rounded
  ];
  String _selectedCountry = "Belarus";
  IconData _selectedIcon = Icons.person;
  IconData display = Icons.person;
  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: Text("New User"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          focusNode: _nameFocus,
                          onFieldSubmitted: (_) {
                            _fieldFocusChange(context, _nameFocus, _phoneFocus);
                          },
                          controller: _firstNameController,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            labelText: "First name",
                            hintText: "Ivan",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _firstNameController.clear();
                              },
                              child: Icon(Icons.delete),
                            ),
                            prefixIcon: Icon(Icons.person_add),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.green, width: 2)),
                          ),
                          onSaved: (value) => newUser.firstName = value!,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              // icon: Icon(Icons.map),
                              //suffixIcon: Icon(display),
                              labelText: "Icon",
                            ),
                            items: _iconsUser.map((icon) {
                              return DropdownMenuItem(
                                child: Icon(icon),
                                value: icon,
                              );
                            }).toList(),
                            onChanged: (data) => setState(() {
                              display = data as IconData;
                              _selectedIcon = data as IconData;
                            }),
                            onSaved: (value) =>
                                newUser.icon = value as IconData,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _lastNameController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Last name",
                      hintText: "Ivanov",
                      suffixIcon: GestureDetector(
                        onLongPress: () {
                          _lastNameController.clear();
                        },
                        child: Icon(Icons.delete),
                      ),
                      prefixIcon: Icon(Icons.person_add),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.green, width: 2)),
                    ),
                    onSaved: (value) => newUser.lastName = value!,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "i_ivanov@gamil.com",
                        prefixIcon: Icon(Icons.mail),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        )),
                    onSaved: (value) => newUser.email = value!,
                    // validator: (val) => _validEmail(val!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    focusNode: _phoneFocus,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _phoneFocus, _passwordFocus);
                    },
                    controller: _phoneController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Phone",
                      hintText: "375(29)###-##-##",
                      prefixIcon: Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.green, width: 2)),
                    ),
                    onSaved: (value) => newUser.lastName = value!,
                    maxLength: 18,
                    keyboardType: TextInputType.phone,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter(r'^[()\d-]{1,15}$',
                    //       allow: true)
                    // ],
                    // validator: (value) => _validPhoneNumber(value)
                    //     ? null
                    //     : "Phone number must be as 375(29)111-11-11",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    focusNode: _passwordFocus,
                    controller: _passwordController,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "length must be 8 symbols",
                      prefixIcon: Icon(Icons.security),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: Icon(_hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    maxLength: 8,
                    validator: (val) => _validatePasswords(val!),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                      hintText: "length must be 8 symbols",
                      prefixIcon: Icon(Icons.security),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: Icon(_hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    maxLength: 8,
                    validator: (val) => _validatePasswords(val!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.map),
                      labelText: "Country?",
                    ),
                    items: _countries.map((country) {
                      return DropdownMenuItem(
                        child: Text(country),
                        value: country,
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _selectedCountry = data as String;
                        newUser.country = data;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      var user1 = _printData();
                      if (_formKey.currentState?.validate() as bool) {
                        _formKey.currentState?.save();
                        _showDialog(
                            text: user1, route: "/userPage", arg: newUser);

                        // Navigator.pushNamed(
                        //   context,
                        //   "/userPage",
                        //   arguments: user1,
                        // );
                      } else {
                        _showMessage(message: "Form is not valid");
                      }
                    },
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialog({text, route, arg}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("It's corrext data?"),
            content: Column(
              children: [
                Text("${newUser.firstName} ${newUser.lastName}"),
                Text("${newUser.email ?? ''} ${newUser.phone ?? ""}"),
                Text("${newUser.country}"),
                // Text("${text['firstName']} ${text['lastName']}"),
                // Text("${text['email']} ${text['phone']}"),
                // Text("${text['country']}"),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        route,
                        arguments: arg,
                      );
                    },
                    child: Text("Confirm"),
                  )
                ],
              ),
            ],
          );
        });
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //duration: Duration(seconds: 1),
        //backgroundColor: Colors.red,
        content: Text(
      message,
      //textAlign: TextAlign.center,
      //style: TextStyle(fontSize: 20),
    )));
  }

  Map _printData() {
    return {
      'firstName': '${_firstNameController.text}',
      'lastName': '${_lastNameController.text}',
      'email': '${_emailController.text}',
      'phone': '${_phoneController.text}',
      'password': '${_passwordController.text}',
      'confirmPassword': '${_confirmPasswordController.text}',
      'country': _selectedCountry,
      'icon': _selectedIcon,
    };
  }

  String? _validateName(String value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if (value.isEmpty) {
      return "Name is reqired";
    } else if (!_nameExp.hasMatch(value)) {
      return "Please enter alphabetical characters";
    } else {
      return null;
    }
  }

  bool _validPhoneNumber(String? input) {
    final _phoneExp = RegExp(r'^\d\d\d\(\d\d\)\d\d\d-\d\d-\d\d$');
    return _phoneExp.hasMatch(input!);
  }

  String? _validEmail(String value) {
    final _emailRegExp =
        RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}');
    if (value.isEmpty as bool) {
      return "Email is required";
    } else if (!_emailRegExp.hasMatch(value)) {
      return "Please enter correct email";
    }
  }

  String? _validatePasswords(String value) {
    if (_passwordController.text.length != 8) {
      return "8 character required for password";
    } else if (_confirmPasswordController.text != _passwordController.text) {
      return "Password does nor match";
    } else {
      return null;
    }
  }
}
