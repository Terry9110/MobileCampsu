import 'dart:io';

import 'package:campsu/globalNav/index.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as path;
import 'package:rflutter_alert/rflutter_alert.dart';

class AddNewEventModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errMessage;
  String? _filePath;
  String? _eventName, _subtitle, _place, _organizerName, _eventDescription;
  int _totalTicket = 0;
  int _ticketPrice = 0;
  DateTime _date = DateTime.now();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  bool get isLoading => _isLoading;
  String? get errMessage => _errMessage;
  String? get eventName => _eventName;
  String? get subtitle => _subtitle;
  String? get filePath => _filePath;
  String? get place => _place;
  int get totalTicket => _totalTicket;
  DateTime get date => _date;
  int get ticketPrice => _ticketPrice;
  String? get organizerName => _organizerName;
  String? get eventDescription => _eventDescription;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessage(String? msg) {
    _errMessage = msg;
    notifyListeners();
  }

  void cancelImage() {
    _filePath = null;
    notifyListeners();
  }

  void setOrganizerName(String? val) {
    _organizerName = val;
    notifyListeners();
  }

  void setTicketPrice(int price) {
    _ticketPrice = price;
    notifyListeners();
  }

  void setEventDescription(String? val) {
    _eventDescription = val;
    notifyListeners();
  }

  void setEventName(String? val) {
    _eventName = val;
    notifyListeners();
  }

  void setSubtitle(String? val) {
    _subtitle = val;
    notifyListeners();
  }

  void setPlace(String? val) {
    _place = val;
    notifyListeners();
  }

  void setDate(DateTime val) {
    _date = val;
    notifyListeners();
  }

  void setNoOfTickets(int? val) {
    if (val == null) {
      _totalTicket = 0;
      notifyListeners();
      return;
    }
    _totalTicket = val;
    notifyListeners();
  }

  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'jpeg',
      ],
    );
    if (result == null) {
      return;
    }
    _filePath = result.files.first.path;
    notifyListeners();
  }

  Future<String> uploadFile(String filePath) async {
    File file = File(filePath);
    String basename = path.basename(filePath);
    Reference storageRef = storage
        .ref("eventsImage/${DateTime.now().microsecondsSinceEpoch}$basename");
    await storageRef.putFile(file);
    return await storageRef.getDownloadURL();
  }

  void addEvent() async {
    if (_eventName == null || _eventName!.isEmpty) {
      setErrorMessage("Event name is not valid");
      return;
    }
    if (_subtitle == null || _subtitle!.isEmpty) {
      setErrorMessage("Subtitle is not valid");
      return;
    }
    if (_organizerName == null || _organizerName!.isEmpty) {
      setErrorMessage("Organizer name cannot be empty");
      return;
    }
    if (_place == null || _place!.isEmpty) {
      setErrorMessage("Place cannot be empty");
      return;
    }
    if (totalTicket == 0) {
      setErrorMessage("Invalid no. of tickets");
      return;
    }
    if (_ticketPrice == 0) {
      setErrorMessage("Invalid ticket price");
      return;
    }
    if (_eventDescription == null || _eventDescription!.isEmpty) {
      setErrorMessage("Event description is not valid");
      return;
    }

    if (_eventDescription!.length < 50) {
      setErrorMessage("Event description must have minimum of 50 letters");
      return;
    }

    if (_filePath == null || _filePath!.isEmpty) {
      setErrorMessage("You must add an Banner");
      return;
    }

    setErrorMessage(null);
    setLoading(true);

    String fileUrl = await uploadFile(_filePath!);

    CollectionReference eventsRef = firestore.collection("Events");

    Map<String, dynamic> payload = {
      "event_name": _eventName,
      "subtitle": _subtitle,
      "organizer_name": _organizerName,
      "event_date": _date,
      "place": _place,
      "total_tickets": _totalTicket,
      "ticket_price": _ticketPrice,
      "event_desc": _eventDescription,
      "image_url": fileUrl,
      "no_of_tickets_booked": 0,
      "created_on": DateTime.now(),
      "active": true,
      "db_reference": eventsRef.doc().id,
      "interested": [],
      "views": [],
      "total_interested": 0,
      "total_views": 0,
    };

    eventsRef.doc(payload["db_reference"]).set(payload).then((value) {
      print("event added succesfully");
      setLoading(false);
      showSuccessMessage();
      return;
    }).catchError((e) {
      print(e.toString());
      setErrorMessage(e.toString());
      setLoading(false);
      return;
    });
  }

  void showSuccessMessage() {
    Alert(
      context: globalNav.navigatorKey.currentContext!,
      type: AlertType.success,
      title: "Campsu",
      desc: "Event Added Succesfully",
      buttons: [
        DialogButton(
          child: Text(
            "CLOSE",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
          ),
          onPressed: () =>
              Navigator.pop(globalNav.navigatorKey.currentContext!),
          width: 120,
        )
      ],
    ).show();
  }
}
