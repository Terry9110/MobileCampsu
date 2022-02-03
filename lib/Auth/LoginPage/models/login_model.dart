import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class LoginModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errMessage;
  String? _email, _password;

  bool get isLoading => _isLoading;
  String? get errMessage => _errMessage;
  String? get email => _email;
  String? get password => _password;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFunctions functions = FirebaseFunctions.instance;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessage(String? err) {
    _errMessage = err;
    notifyListeners();
  }

  void setEmail(String? val) {
    _email = val;
    notifyListeners();
  }

  void setPassword(String? val) {
    _password = val;
    notifyListeners();
  }

  void login() {
    setErrorMessage(null);
    setLoading(true);

    Map<String, dynamic> payload = {
      "email": _email,
      "password": md5.convert(utf8.encode(_password ?? "")).toString()
    };

    HttpsCallable loginRef = functions.httpsCallable("login");

    loginRef.call(payload).then((HttpsCallableResult value) async {
      setLoading(false);
      if (value.data["status"] == "failure") {
        setErrorMessage(value.data["message"]);
        return;
      }
      setErrorMessage("We are redirecting. Please wait.");
      await auth.signInWithCustomToken(value.data["token"]);
    }).catchError((e) {
      print(e);
      setLoading(false);
      setErrorMessage(e.toString());
    });
  }
}
