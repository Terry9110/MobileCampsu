import 'package:campsu/EventsPage/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatefulWidget {
  const EventDetails(
      {Key? key,
      required this.imageUrl,
      required this.eventName,
      required this.subtitle,
      required this.date,
      required this.place,
      required this.totalInterested,
      required this.organizerName,
      required this.totalViews})
      : super(key: key);
  final String imageUrl;
  final String eventName;
  final String subtitle;
  final DateTime date;
  final String place;
  final int totalInterested;
  final int totalViews;
  final String organizerName;
  @override
  State<EventDetails> createState() => _EventDetails();
}

class _EventDetails extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventsPage(
                        imageUrl: widget.imageUrl,
                        eventName: widget.eventName,
                        subtitle: widget.subtitle,
                        date: widget.date,
                        place: widget.place,
                        totalInterested: widget.totalInterested,
                        totalViews: widget.totalViews,
                        organizerName: widget.organizerName,
                      )));
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 7.0,
                ),
              ],
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.imageUrl))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.eventName,
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFFFFFDFA),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(widget.subtitle,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFDFA)))
                              ]),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Buy Now",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))
                                  ],
                                )),
                              ))
                        ],
                      )
                    ],
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.today_outlined,
                                    color: Colors.grey[800]),
                                const SizedBox(width: 10),
                                Text(
                                    DateFormat('E , d MMM y')
                                        .format(widget.date),
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.place_outlined,
                                    color: Colors.grey[800]),
                                const SizedBox(width: 10),
                                Text(widget.place,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 12))
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Icon(Icons.timer_outlined,
                                  color: Colors.grey[800]),
                              const SizedBox(width: 10),
                              Text(DateFormat('hh:mm a').format(widget.date),
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey[800]))
                            ]),
                            const SizedBox(height: 10),
                            Row(children: [
                              Icon(Icons.map_outlined, color: Colors.grey[800]),
                              const SizedBox(width: 10),
                              Text("2.4 Miles",
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey[800]))
                            ])
                          ],
                        )
                      ])),
              const SizedBox(height: 10),
              Divider(height: 1, color: Colors.grey[300]),
              const SizedBox(height: 15),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${widget.totalInterested}",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(width: 5),
                            Text("Interested",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500]))
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.visibility_outlined,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 10),
                          Text('${widget.totalViews}',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(width: 10),
                          Text("View",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
