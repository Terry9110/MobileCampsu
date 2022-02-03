import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EventListModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errMessage;
  String? _searchKey;
  final List<Map<String, dynamic>> _eventsList = [];
  Query? nextQuery;

  bool get isLoading => _isLoading;
  String? get errMessage => _errMessage;
  String? get searchKey => _searchKey;
  List<Map<String, dynamic>> get eventsList => _eventsList;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessage(String? msg) {
    _errMessage = msg;
    notifyListeners();
  }

  void getEventsList() async {
    setLoading(true);
    setErrorMessage(null);

    Query? query;

    CollectionReference eventsRef = firestore.collection("Events");

    if (nextQuery == null) {
      query = eventsRef
          .where("active", isEqualTo: true)
          .where("event_date", isGreaterThan: DateTime.now())
          .orderBy("event_date")
          .limit(25);
    } else {
      query = nextQuery;
    }

    query?.get().then((QuerySnapshot snap) {
      for (var doc in snap.docs) {
        try {
          Map<String, dynamic> eventData = {
            "active": doc.get("active"),
            "created_on": doc.get("created_on").toDate(),
            "db_reference": doc.get("db_reference"),
            "event_date": doc.get("event_date").toDate(),
            "event_desc": doc.get("event_desc"),
            "event_name": doc.get("event_name"),
            "image_url": doc.get("image_url"),
            "no_of_tickets_booked": doc.get("no_of_tickets_booked"),
            "organizer_name": doc.get("organizer_name"),
            "place": doc.get("place"),
            "subtitle": doc.get("subtitle"),
            "ticket_price": doc.get('ticket_price'),
            "total_tickets": doc.get('total_tickets'),
            "total_interested": doc.get("total_interested"),
            "total_views": doc.get("total_views"),
            "interested": doc.get("interested"),
            "views": doc.get("views"),
          };
          _eventsList.add(eventData);
        } catch (e) {
          print(e);
        }
      }
      if (snap.docs.isNotEmpty) {
        print("No Elements");
        nextQuery = eventsRef
            .where("active", isEqualTo: true)
            .where("event_date", isGreaterThan: DateTime.now())
            .orderBy("event_date")
            .startAfter([snap.docs.last]);
      }
      setLoading(false);
      notifyListeners();
    }).catchError((e) {
      print("Error from query");
      print(e);
      setLoading(false);
      setErrorMessage(e.toString());
    });
  }
}
