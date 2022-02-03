import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campsu/theme.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPage();
}

class _CheckoutPage extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/congragulations");
          },
          child: Container(
              height: 60,
              decoration: const BoxDecoration(color: activeGreenPrimary),
              child: Center(
                  child: Text("PAY  NOW",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600))))),
      body: ListView(
        children: [
          const SizedBox(height: 0),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500]!,
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.black),
                      ))
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: activeRedPrimary,
                size: 40,
              ),
              const SizedBox(height: 5),
              Text('Summary',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: activeRedPrimary))
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemsList(),
                const SizedBox(height: 30),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FaIcon(FontAwesomeIcons.ccVisa,
                                size: 40, color: Colors.blue[800]),
                            FaIcon(FontAwesomeIcons.ccMastercard,
                                size: 40, color: Colors.grey[400]),
                            FaIcon(FontAwesomeIcons.ccPaypal,
                                size: 40, color: Colors.grey[400]),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            inputFieldComp(name: "CARDHOLDERS NAME"),
                            const SizedBox(height: 10),
                            inputFieldComp(name: "CARD NUMBER"),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: inputFieldComp(name: "EXP DATE")),
                                const SizedBox(width: 40),
                                Expanded(
                                    flex: 1,
                                    child: inputFieldComp(name: "CVV/CVV2"))
                              ],
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget inputFieldComp({required String name}) {
    return TextField(
      style: GoogleFonts.poppins(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!)),
          contentPadding: const EdgeInsets.only(right: 10, top: 10, bottom: 0),
          label: Text(name,
              style:
                  GoogleFonts.poppins(fontSize: 12, color: Colors.grey[400])),
          labelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
              fontSize: 10)),
    );
  }

  Widget itemsList() {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 2.0,
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            checkoutItems(
                name: "1 Ticket Camp #550",
                value: "\$200.00",
                imageUrl:
                    "https://res.cloudinary.com/dwzmsvp7f/image/fetch/q_75,f_auto,w_1316/https%3A%2F%2Fmedia.insider.in%2Fimage%2Fupload%2Fc_crop%2Cg_custom%2Fv1519627962%2Fvltlogy23k1iid9pjffx.jpg"),
            checkoutItems(
                name: "3 Ticket Camp #650",
                value: "\$600.00",
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8UwDXxIB4PMZd9DtVfjMG663cNIREqeYYUOHlT3CbQbtxldn500vMevxEp3moCehEmaQ&usqp=CAU"),
            checkoutItems(
                name: "4 Ticket Camp #420",
                value: "\$49.00",
                imageUrl:
                    "https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 15),
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Total : ",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                          fontSize: 14)),
                  const SizedBox(width: 10),
                  Text("\$10000.000",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ));
  }

  Widget checkoutItems(
      {required String name, required String value, required String imageUrl}) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        margin: const EdgeInsets.only(top: 10),
        child: Column(children: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red.shade300,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(imageUrl)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(name,
                            style: GoogleFonts.poppins(
                                color: Colors.grey[500],
                                fontSize: 12,
                                fontWeight: FontWeight.w600))
                      ]),
                  Text(value,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              )),
          const SizedBox(height: 10),
          Divider(
            height: 2,
            color: Colors.grey[300],
          )
        ]));
  }
}
