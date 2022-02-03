import 'dart:io';

import 'package:campsu/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:campsu/AddNewEvent/models/add_new_event_model.dart';
import 'package:provider/provider.dart';

class AddNewEvent extends StatefulWidget {
  const AddNewEvent({Key? key}) : super(key: key);

  @override
  State<AddNewEvent> createState() => _AddNewEvent();
}

class _AddNewEvent extends State<AddNewEvent> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddNewEventModel>(context);
    return SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: activeGreenPrimary,
            title: Text(
              "Add New Event",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
            ),
          ),
          bottomNavigationBar: bottomBar(),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
            child: ListView(children: [
              const SizedBox(height: 20),
              imageInput(),
              const SizedBox(height: 20),
              inputField(
                  fieldName: "Event Name",
                  inputType: TextInputType.name,
                  value: provider.eventName ?? "",
                  onChanged: (txt) {
                    provider.setEventName(txt);
                  }),
              const SizedBox(height: 20),
              inputField(
                  fieldName: "Subtitle",
                  inputType: TextInputType.name,
                  value: provider.subtitle ?? "",
                  onChanged: (txt) {
                    provider.setSubtitle(txt);
                  }),
              const SizedBox(height: 20),
              inputField(
                  fieldName: "Organizer Name",
                  inputType: TextInputType.name,
                  value: provider.organizerName ?? "",
                  onChanged: (txt) {
                    provider.setOrganizerName(txt);
                  }),
              const SizedBox(height: 20),
              DateTimeFormField(
                decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black45),
                    errorStyle: const TextStyle(color: Colors.redAccent),
                    suffixIcon: const Icon(Icons.event_note),
                    labelText: 'Date Time',
                    contentPadding: const EdgeInsets.only(
                        left: 15, top: 8, right: 8, bottom: 8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey[400]!))),
                initialDate: provider.date,
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                onDateSelected: (DateTime value) {
                  print(value);
                  provider.setDate(value);
                },
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 1),
              ),
              const SizedBox(height: 20),
              inputField(
                  fieldName: "Place",
                  inputType: TextInputType.name,
                  value: provider.place ?? "",
                  onChanged: (txt) {
                    provider.setPlace(txt);
                  }),
              const SizedBox(height: 20),
              inputField(
                fieldName: "Total Tickets",
                inputType: TextInputType.number,
                value: provider.totalTicket.toString(),
                onChanged: (String val) {
                  if (val.isEmpty) {
                    provider.setNoOfTickets(0);
                    return;
                  }
                  provider.setNoOfTickets(int.parse(val));
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              const SizedBox(height: 20),
              inputField(
                fieldName: "Ticket Price (\$)",
                inputType: TextInputType.name,
                value: provider.ticketPrice.toString(),
                onChanged: (String val) {
                  if (val.isEmpty) {
                    provider.setTicketPrice(0);
                    return;
                  }
                  provider.setTicketPrice(int.parse(val));
                },
              ),
              const SizedBox(height: 20),
              eventDetails(),
              const SizedBox(height: 20),
              Visibility(
                  visible: provider.errMessage != null,
                  child: Text(provider.errMessage ?? "",
                      style: GoogleFonts.poppins(color: Colors.red))),
              const SizedBox(height: 40),
            ]),
          ),
        ));
  }

  Widget bottomBar() {
    final provider = Provider.of<AddNewEventModel>(context);
    return InkWell(
        onTap: () {
          if (provider.isLoading) {
            return;
          }
          provider.addEvent();
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: activeGreenPrimary,
                  borderRadius: BorderRadius.circular(10)),
              child: (!provider.isLoading)
                  ? Center(
                      child: Text("Add Event",
                          style: GoogleFonts.poppins(color: Colors.white)))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                          CircularProgressIndicator(
                            color: Colors.white,
                          )
                        ]),
            )));
  }

  Widget imageInput() {
    final provider = Provider.of<AddNewEventModel>(context);
    return Builder(builder: (context) {
      if (provider.filePath == null) {
        return InkWell(
            onTap: () {
              provider.selectFile();
            },
            child: DottedBorder(
              color: Colors.black45,
              strokeWidth: 1,
              padding: const EdgeInsets.all(50),
              child: const Center(
                child: Icon(Icons.add_a_photo),
              ),
            ));
      }
      return Column(children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                fit: BoxFit.fill, image: FileImage(File(provider.filePath!))),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
            onTap: () {
              provider.cancelImage();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: activeRedPrimary,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text("Remove",
                    style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ))
      ]);
    });
  }

  Widget eventDetails() {
    final provider = Provider.of<AddNewEventModel>(context);
    TextEditingController controller = TextEditingController();
    controller.text = provider.eventDescription ?? "";
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return TextField(
        onChanged: (String txt) {
          provider.setEventDescription(txt);
        },
        maxLines: 5,
        minLines: 4,
        decoration: InputDecoration(
            labelText: "Event Description",
            labelStyle: GoogleFonts.poppins(color: Colors.black45),
            contentPadding:
                const EdgeInsets.only(left: 15, top: 8, right: 8, bottom: 8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey[400]!))));
  }

  Widget inputField(
      {required String fieldName,
      List<TextInputFormatter>? inputFormatters,
      required TextInputType inputType,
      required String value,
      required Function onChanged}) {
    TextEditingController controller = TextEditingController();
    controller.text = value;
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return TextField(
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        controller: controller,
        onChanged: (String txt) {
          onChanged(txt);
        },
        decoration: InputDecoration(
            labelText: fieldName,
            labelStyle: GoogleFonts.poppins(color: Colors.black45),
            contentPadding:
                const EdgeInsets.only(left: 15, top: 8, right: 8, bottom: 8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey[400]!))));
  }
}
