import 'package:campsu/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {
  const EventsPage(
      {Key? key,
      required this.imageUrl,
      required this.eventName,
      required this.subtitle,
      required this.date,
      required this.place,
      required this.totalInterested,
      required this.totalViews,
      required this.organizerName})
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
  State<EventsPage> createState() => _EventsPage();
}

class _EventsPage extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          floatingActionButton: Container(
              margin: const EdgeInsets.only(left: 30),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/checkout");
                  },
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: activeRedPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                        child: Text("GET TICKETS",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500))),
                  ))),
          body: Stack(
            children: [
              Container(
                  height: height * 0.3,
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.imageUrl))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.chevron_left,
                                            color: Colors.white),
                                      ),
                                    )),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(Icons.favorite_border,
                                    color: Colors.grey),
                              ),
                            ),
                          ])
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: height * 0.27),
                padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://cdn.dribbble.com/users/2398989/screenshots/6597610/presentation_dark2.jpg"))),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CREATED BY",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              Text(widget.organizerName,
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey[600], fontSize: 10))
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 2,
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.redAccent.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text("+ Follow",
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colors.white)),
                                      ),
                                    )
                                  ],
                                )))
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text("Camp Event with company",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 12)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_outline,
                                color: Colors.grey[600]),
                            Text("Interested",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 10))
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.done, color: Colors.grey[600]),
                            Text("Going",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 10))
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.share, color: Colors.grey[600]),
                            Text("Share",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 10))
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.more_horiz, color: Colors.grey[600]),
                            Text("Share",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 10))
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text("4.5",
                                  style:
                                      GoogleFonts.poppins(color: Colors.red))),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("Sun , 20 August 2020",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))),
                            const SizedBox(height: 5),
                            Text("12PM to 10 PM",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://cdn.wccftech.com/wp-content/uploads/2017/03/Google-Maps.jpg"))),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("Get Direction",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))),
                            const SizedBox(height: 5),
                            Text("Three miles island, London , UK",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey[400],
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Icon(Icons.confirmation_num,
                                color: Colors.white)),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text("55 Tickets",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))),
                            const SizedBox(height: 5),
                            Text("only Available",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey[400],
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text('Event Details',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    Text(
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis",
                        style: GoogleFonts.poppins(
                            color: Colors.grey[500], fontSize: 10)),
                    const SizedBox(height: 100),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
