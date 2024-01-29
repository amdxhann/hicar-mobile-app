import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcar/controllers/cars/EditCarsController.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class EditCars extends StatefulWidget {
  @override
  State<EditCars> createState() => _EditCarsState();
}

class _EditCarsState extends State<EditCars> {
  // ignore: non_constant_identifier_names
  final EditCarsC = Get.put(EditCarsController());
  File? _image;
  String? imageUrl;
  String? imagePath;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImageToFirebase() async {
    String fileName = DateTime.now().toString();

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child('images/$fileName');
    UploadTask uploadTask = reference.putFile(_image!);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    imagePath = imageUrl;

    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    final EditCarsC = Get.find<EditCarsController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leadingWidth: 20,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 4, 28, 50),
        title: const Text(
          "Edit Cars",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: EditCarsC.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            EditCarsC.namaC.text = data['nama'];
            EditCarsC.kecepatanC.text = data['kecepatan'];
            EditCarsC.hargaC.text = data['harga'];

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _image == null
                          ? Text('No image selected.')
                          : Image.file(_image!),
                      OutlinedButton(
                          onPressed: () {
                            getImage();
                          },
                          child: Text("SELECT IMAGES")),
                      const SizedBox(
                        height: 10,
                      ),
                      Name(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Transmision(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Speed(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Ac(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Doors(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Price(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Wifi(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Seat(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Sensor(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Bluetooth(EditCarsC: EditCarsC),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  String imageUrl =
                                      await uploadImageToFirebase();
                                  EditCarsC.editCars(
                                      EditCarsC.jenisC.dropDownValue!.value
                                          .toString(),
                                      EditCarsC
                                          .jumlahpintuC.dropDownValue!.value
                                          .toString(),
                                      EditCarsC.kecepatanC.text,
                                      EditCarsC.acC.dropDownValue!.value
                                          .toString(),
                                      EditCarsC.hargaC.text,
                                      EditCarsC.namaC.text,
                                      EditCarsC.wifiC.dropDownValue!.value
                                          .toString(),
                                      EditCarsC.seatC.dropDownValue!.value
                                          .toString(),
                                      EditCarsC.sensorC.dropDownValue!.value
                                          .toString(),
                                      EditCarsC.bluetoothC.dropDownValue!.value
                                          .toString(),
                                      Get.arguments,
                                      imageUrl);
                                },
                                child: const Text(
                                  "Edit Cars",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  EditCarsC.deleteCars(Get.arguments);
                                },
                                child: const Text(
                                  "Delete Cars",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// transmission

class Transmision extends StatefulWidget {
  const Transmision({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  State<Transmision> createState() => _TransmisionState();
}

var selectedValue;

class _TransmisionState extends State<Transmision> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.EditCarsC.jenisC.dropDownValue = selectedValue;
          final valueee = widget.EditCarsC.jenisC.dropDownValue!.value;
          print(valueee);
          // print(widget.EditCarsC.jenisC.dropDownValue!.value);
        });
      },
      controller: widget.EditCarsC.jenisC,
      textFieldDecoration: InputDecoration(
          labelText: "Transmision",
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
        DropDownValueModel(name: "Automatic", value: "Automatic"),
        DropDownValueModel(name: "Manual", value: "Manual"),
      ],
    );
  }
}

// carsname
class Name extends StatelessWidget {
  const Name({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        autofocus: false,
        controller: EditCarsC.namaC,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelText: "Cars Name",
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
            )));
  }
}

// cars speed
class Speed extends StatelessWidget {
  const Speed({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        autofocus: false,
        controller: EditCarsC.kecepatanC,
        keyboardType: TextInputType.datetime,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelText: "Speed",
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "km/h",
            hintStyle: TextStyle(color: Color.fromARGB(255, 90, 88, 88)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 15, 15, 15)),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 181, 90, 90)),
              borderRadius: BorderRadius.circular(10),
            )));
  }
}

// AC
class Ac extends StatefulWidget {
  const Ac({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  State<Ac> createState() => _AcState();
}

class _AcState extends State<Ac> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.EditCarsC.acC.dropDownValue = selectedValue;
        });
      },
      controller: widget.EditCarsC.acC,
      textFieldDecoration: InputDecoration(
          labelText: "AC",
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
        DropDownValueModel(name: "A/C", value: "A/C"),
        DropDownValueModel(name: "No A/C", value: "No A/C"),
      ],
    );
  }
}

// doors
class Doors extends StatefulWidget {
  const Doors({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  State<Doors> createState() => _DoorsState();
}

class _DoorsState extends State<Doors> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.EditCarsC.jumlahpintuC.dropDownValue = selectedValue;
          final valueee = widget.EditCarsC.jumlahpintuC.dropDownValue!.value;
          print(valueee);
          // print(widget.EditCarsC.jenisC.dropDownValue!.value);
        });
      },
      controller: widget.EditCarsC.jumlahpintuC,
      textFieldDecoration: InputDecoration(
          labelText: "Doors",
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
        DropDownValueModel(name: "2", value: "2"),
        DropDownValueModel(name: "4", value: "4"),
      ],
    );
  }
}

// cars price
class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        autofocus: false,
        controller: EditCarsC.hargaC,
        keyboardType: TextInputType.datetime,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelText: "Price",
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
            )));
  }
}

class Wifi extends StatefulWidget {
  const Wifi({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  State<Wifi> createState() => _WifiState();
}

class _WifiState extends State<Wifi> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.EditCarsC.wifiC.dropDownValue = selectedValue;
          final valueee = widget.EditCarsC.wifiC.dropDownValue!.value;
          print(valueee);
          // print(widget.EditCarsC.wifiC.dropDownValue!.value);
        });
      },
      controller: widget.EditCarsC.wifiC,
      textFieldDecoration: InputDecoration(
          labelText: "Wifi",
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
        DropDownValueModel(name: "Available", value: "Available"),
        DropDownValueModel(name: "Unavailable", value: "Unavailable"),
      ],
    );
  }
}

class Seat extends StatefulWidget {
  const Seat({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.EditCarsC.seatC.dropDownValue = selectedValue;
          final valueee = widget.EditCarsC.seatC.dropDownValue!.value;
          print(valueee);
          // print(widget.EditCarsC.seatC.dropDownValue!.value);
        });
      },
      controller: widget.EditCarsC.seatC,
      textFieldDecoration: InputDecoration(
          labelText: "Seat",
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
        DropDownValueModel(name: "2", value: "2"),
        DropDownValueModel(name: "4", value: "4"),
        DropDownValueModel(name: "6", value: "6"),
      ],
    );
  }
}

class Sensor extends StatefulWidget {
  const Sensor({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  State<Sensor> createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.EditCarsC.sensorC.dropDownValue = selectedValue;
          final valueee = widget.EditCarsC.sensorC.dropDownValue!.value;
          print(valueee);
          // print(widget.EditCarsC.sensorC.dropDownValue!.value);
        });
      },
      controller: widget.EditCarsC.sensorC,
      textFieldDecoration: InputDecoration(
          labelText: "Sensor",
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
        DropDownValueModel(name: "Available", value: "Available"),
        DropDownValueModel(name: "Unavailable", value: "Unavailable"),
      ],
    );
  }
}

class Bluetooth extends StatefulWidget {
  const Bluetooth({
    super.key,
    required this.EditCarsC,
  });

  final EditCarsController EditCarsC;

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.EditCarsC.bluetoothC.dropDownValue = selectedValue;
          final valueee = widget.EditCarsC.bluetoothC.dropDownValue!.value;
          print(valueee);
          // print(widget.EditCarsC.bluetoothC.dropDownValue!.value);
        });
      },
      controller: widget.EditCarsC.bluetoothC,
      textFieldDecoration: InputDecoration(
          labelText: "Bluetooth",
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
        DropDownValueModel(name: "Available", value: "Available"),
        DropDownValueModel(name: "Unavailable", value: "Unavailable"),
      ],
    );
  }
}
