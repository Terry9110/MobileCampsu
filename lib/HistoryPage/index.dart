import 'package:flutter/material.dart';
import 'package:campsu/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: activeGreenPrimary,
        centerTitle: true,
        leading: const Icon(Icons.menu_outlined, color: Colors.white),
        title: Text("Delivery Status",
            style: GoogleFonts.poppins(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Text("Sent",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 12)),
                            const SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 3,
                              color: activeRedPrimary,
                            )
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Incoming",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 12))
                          ],
                        ))
                  ])),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  color: Colors.grey[200],
                  child: ListView(
                    children: [
                      productDetails(
                          name: "ABC Event",
                          status: "Pending Delivery",
                          statusColor: Colors.orange,
                          imageUrl:
                              "https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"),
                      productDetails(
                          name: "Great Event",
                          status: "Delivered",
                          statusColor: Colors.green,
                          imageUrl:
                              "https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      productDetails(
                          name: "Starting now Event",
                          status: "Cancelled",
                          statusColor: Colors.red,
                          imageUrl:
                              "https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    ],
                  ))),
        ],
      ),
    );
  }

  Widget productDetails(
      {required String name,
      required String status,
      required String imageUrl,
      required Color statusColor}) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(image: NetworkImage(imageUrl))),
                )),
            const SizedBox(width: 10),
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(name,
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 12)),
                    Text(status,
                        style: GoogleFonts.poppins(
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10))
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: const Center(
                    child: Icon(Icons.call, color: Colors.green),
                  ),
                ))
          ],
        ));
  }
}
