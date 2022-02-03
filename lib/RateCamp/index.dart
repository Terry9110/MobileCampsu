import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campsu/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateCamp extends StatefulWidget {
  @override
  State<RateCamp> createState() => _RateCamp();
}

class _RateCamp extends State<RateCamp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 10,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Write a Thank you note",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.grey[500], fontSize: 12)),
                )),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: activeGreenPrimary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                  child: Text("Pay",
                      style: GoogleFonts.poppins(color: Colors.white))),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: activeGreenPrimary,
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.chevron_left, color: Colors.white),
                Expanded(
                    child: Center(
                        child: Text('Rate Camp',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 30,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: 250,
                        child: Text(
                            "Other users will not be able to see this rating, it will be shared only with shop.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: 12,
                            )))
                  ])),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text("Give a Compliment ? ",
                            style: GoogleFonts.poppins(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w400))),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(width: 20),
                            compliment(name: "Excellent Service"),
                            compliment(name: "Fast Delivery", active: true),
                            compliment(name: "Nice Party", active: false),
                            compliment(
                                name: "Awesome Experience", active: false),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget compliment({required String name, bool active = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: active ? activeGreenPrimary : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 0.5,
              color: active ? activeGreenPrimary : Colors.grey[600]!)),
      child: Center(
        child: Text(name,
            style: GoogleFonts.poppins(
                fontSize: 12, color: active ? Colors.white : Colors.grey[500])),
      ),
    );
  }
}
