import 'package:campsu/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campsu/EventsList/event_details_widget.dart';

class EventsList2 extends StatefulWidget {
  @override
  State<EventsList2> createState() => _EventsList2();
}

class _EventsList2 extends State<EventsList2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 70,
          padding: const EdgeInsets.only(left: 0, right: 0),
          decoration: BoxDecoration(
            color: activeGreenPrimary.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab1',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab2',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab3',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab4',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.white,
                  ),
                  Text('Tab5',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12))
                ],
              ),
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: activeGreenPrimary,
            ),
            child: Center(
                child: Text("Events",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, color: Colors.white))),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 10.0,
                ),
              ]),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    Text("Events",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                      height: 5,
                      width: 60,
                      color: Colors.green,
                    )
                  ]),
                  Text("Calendar",
                      style: GoogleFonts.poppins(color: Colors.black54)),
                  Text("Hosting",
                      style: GoogleFonts.poppins(color: Colors.black54))
                ],
              )),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 0),
                child: ListView(children: [
                  Text("Upcoming Events",
                      style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                ])),
          )
        ],
      ),
    );
  }
}
