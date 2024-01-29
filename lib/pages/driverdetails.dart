import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentcar/controllers/Transaksi/transaksiController.dart';
import 'package:rentcar/routes/routes_name.dart';
import '../controllers/cars/detailCarsController.dart';
import '../controllers/users/editUser.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';

class driverdetails extends StatefulWidget {
  @override
  State<driverdetails> createState() => _driverdetailsState();
}

class _driverdetailsState extends State<driverdetails> {
  @override
  final editUserC = Get.put(editUserController(), permanent: true);
  final transaksiC = Get.put(TransaksiController(), permanent: true);
  static DateTime startDate = DateTime.now();
  String quoteStartDate = DateFormat.yMMMMEEEEd()
      .format(startDate.add(Duration(days: 1)))
      .toString();
  String endPeriod = DateFormat.yMMMMEEEEd()
      .format(DateTime.now().add(Duration(days: 30)))
      .toString();
  final DetailCarsC = Get.put(DetailCarsController());

  // TextEditingController alamatC;
  Widget build(BuildContext context) {
    final editUserC = Get.find<editUserController>();
    final transaksiC = Get.find<TransaksiController>();
    final DetailCarsC = Get.find<DetailCarsController>();
    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: DetailCarsC.getData(Get.arguments),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              appBar: null,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 40,
                      ),
                    ),
                    pinned: true,
                    toolbarHeight: 90,
                    centerTitle: true,
                    title: Text(
                      "Information",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            size: 40.0,
                          )),
                      Padding(padding: EdgeInsets.only(right: 10))
                    ],
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      height: 800,
                      color: Color.fromARGB(255, 4, 28, 50),
                      child: Container(
                        height: 1 * MediaQuery.of(context).size.height,
                        padding: EdgeInsets.only(top: 50, left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Personal Data",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: editUserC.teleponC,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppin', fontSize: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: editUserC.alamatC,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: "Address",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppin', fontSize: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: editUserC.noKTPC,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: "National Identify Number",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppin', fontSize: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: editUserC.noSIMC,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: "SIM Number",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppin', fontSize: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Payment(transaksiC: transaksiC),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              // padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("$quoteStartDate"),
                                  ElevatedButton(
                                    child: Text("Tanggal Sewa"),
                                    onPressed: () async {
                                      var selectedFirstDate =
                                          await DatePicker.showSimpleDatePicker(
                                        context,
                                        initialDate: DateFormat.yMMMMEEEEd()
                                            .parse(quoteStartDate),
                                        // firstDate: DateFormat.yMMMMEEEEd().parse(quoteStartDate),
                                        firstDate:
                                            // startDate,
                                            // DateTime(2020),
                                            DateTime.now(),
                                        lastDate: DateTime(2030),
                                        dateFormat: "yyyy-MMMM-dd",
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );

                                      print(
                                          "My date is picked $selectedFirstDate");

                                      setState(() {
                                        setState(() {
                                          quoteStartDate =
                                              DateFormat.yMMMMEEEEd()
                                                  .format(selectedFirstDate!);

                                          print(
                                              "My quoteStartDate is picked $quoteStartDate");

                                          endPeriod = DateFormat.yMMMMEEEEd()
                                              .format(selectedFirstDate
                                                  .add(Duration(days: 30)))
                                              .toString();
                                          // oneYear = selectedFirstDate.add(Duration(days: 29));
                                        });
                                      });
                                    },
                                  ),
                                ],
                              ),
                              width: 400,
                              height: 60,
                              // color: Colors.black,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 1),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              // padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("$endPeriod"),
                                  ElevatedButton(
                                    child: Text("Tanggal Kembali"),
                                    onPressed: () async {
                                      var selectedEndDate =
                                          await DatePicker.showSimpleDatePicker(
                                        context,
                                        initialDate: DateFormat.yMMMMEEEEd()
                                            .parse(endPeriod),
                                        firstDate: DateFormat.yMMMMEEEEd()
                                            .parse(endPeriod)
                                            .subtract(Duration(days: 30)),
                                        lastDate: DateFormat.yMMMMEEEEd()
                                            .parse(quoteStartDate)
                                            .add(Duration(days: 30)),
                                        dateFormat: "yyyy-MMMM-dd",
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );

                                      setState(() {
                                        endPeriod = DateFormat.yMMMMEEEEd()
                                            .format(selectedEndDate!)
                                            .toString();
                                      });

                                      print(
                                          "My date is picked $selectedEndDate");
                                    },
                                  ),
                                ],
                              ),
                              width: 400,
                              height: 60,
                              // color: Colors.black,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 1),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),

                            // SizedBox(
                            //   height: 15,
                            // ),

                            Container(
                              height: 50,
                              width: 150,
                              margin: EdgeInsets.only(top: 100),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 236, 179, 101))),
                                onPressed: () async {
                                  editUserC.getLoginUser(
                                    editUserC.teleponC.text,
                                    editUserC.alamatC.text,
                                    editUserC.noKTPC.text,
                                    editUserC.noSIMC.text,
                                  );
                                  transaksiC.addTransaksi(
                                      transaksiC.metodePembayaranC
                                          .dropDownValue!.value
                                          .toString(),
                                      quoteStartDate,
                                      endPeriod,
                                      Get.arguments);
                                },
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]))
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}

class Payment extends StatefulWidget {
  const Payment({
    super.key,
    required this.transaksiC,
  });

  final TransaksiController transaksiC;

  @override
  State<Payment> createState() => _PaymentState();
}

var selectedValue;

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.transaksiC.metodePembayaranC.dropDownValue = selectedValue;
          final valueee =
              widget.transaksiC.metodePembayaranC.dropDownValue!.value;
          print(valueee);
          // print(widget.AddCarsC.jenisC.dropDownValue!.value);
        });
      },
      controller: widget.transaksiC.metodePembayaranC,
      textFieldDecoration: InputDecoration(
          labelText: "Payment",
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "",
          hintStyle: TextStyle(color: Color.fromARGB(255, 90, 88, 88)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 15, 15, 15)),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 181, 90, 90)),
            borderRadius: BorderRadius.circular(10),
          )),
      dropDownList: [
        DropDownValueModel(
            name: "Pembayaran Ditempat", value: "Pembayaran Ditempat"),
        // DropDownValueModel(name: "Manual", value: "Manual")
      ],
    );
  }
}

// class DateTesting extends StatefulWidget {
//   DateTesting({Key? key}) : super(key: key);

//   @override
//   _DateTestingState createState() => _DateTestingState();
// }

// class _DateTestingState extends State {
//   static DateTime startDate = DateTime.now();
//   String quoteStartDate =
//       DateFormat.yMMMMEEEEd().format(startDate.add(Duration(days: 1))).toString();
//   String endPeriod = DateFormat.yMMMMEEEEd()
//       .format(DateTime.now().add(Duration(days: 30)))
//       .toString();

//   @override
//   Widget build(BuildContext context) {
    
//        return ListView(
//       children: [
       
//       ],
//     );
//   }
// }
