import 'package:campsu/Auth/SignupSuccesful/index.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:campsu/globalNav/index.dart';

class SignupModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errMessage;

  String? _fullName, _email, _userName, _phone, _gender = "male";
  String? _password;
  DateTime _dob = DateTime(DateTime.now().year - 12);

  bool get isLoading => _isLoading;
  String? get errMesssage => _errMessage;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get userName => _userName;
  String? get phone => _phone;
  String? get gender => _gender;
  DateTime get dob => _dob;
  String? get password => _password;

  FirebaseFunctions functions = FirebaseFunctions.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessage(String? msg) {
    _errMessage = msg;
    notifyListeners();
  }

  void setDob(DateTime date) {
    _dob = date;
    notifyListeners();
  }

  void setValues(String key, String val) {
    switch (key) {
      case "name":
        _fullName = val;
        break;
      case "email":
        _email = val;
        break;
      case "userName":
        _userName = val;
        break;
      case "password":
        _password = val;
        break;
      case "phone":
        _phone = val;
        break;
      case "gender":
        _gender = val;
        break;
      default:
        print("Unkown val");
        break;
    }

    notifyListeners();
  }

  void signup() async {
    setErrorMessage(null);
    setLoading(true);

    Map<String, dynamic> payload = {
      "name": _fullName,
      "email": _email,
      "userName": _userName,
      "password": _password,
      "dob": _dob.millisecondsSinceEpoch,
      "phone": _phone,
      "gender": _gender
    };

    print("Payload = $payload");

    try {
      dynamic result = await functions.httpsCallable("signup").call(payload);
      setLoading(false);
      if (result.data["status"] == "failure") {
        setErrorMessage(result.data["message"]);
        return;
      }
      globalNav.navigatorKey.currentState!
          .push(MaterialPageRoute(builder: (context) => SignupSuccess()));
    } catch (e) {
      print(e);
      setErrorMessage(e.toString());
      setLoading(false);
    }
    ;
  }
}
