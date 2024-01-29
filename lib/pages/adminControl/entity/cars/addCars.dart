import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcar/controllers/cars/addCarsController.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class AddCars extends StatefulWidget {
  @override
  State<AddCars> createState() => _AddCarsState();
}

class _AddCarsState extends State<AddCars> {
  File? _image;
  final picker = ImagePicker();
  final AddCarsC = Get.put(AddCarsController());
  String imagePath = "";
  String? imageUrl;

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
    final AddCarsC = Get.find<AddCarsController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leadingWidth: 20,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 4, 28, 50),
        title: const Text(
          "Add Cars",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (_image == null)
                    ? Container(
                        child: Center(child: Text('No image selected.')),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        width: 350,
                        height: 200,
                      )
                    : Container(
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image!), fit: BoxFit.cover)),
                      ),
                OutlinedButton(
                    onPressed: () {
                      getImage();
                    },
                    child: Text("SELECT IMAGES")),
                const SizedBox(
                  height: 10,
                ),
                Name(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Transmision(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Speed(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Ac(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Doors(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Price(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Wifi(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Seat(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Sensor(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                Bluetooth(AddCarsC: AddCarsC),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String imageUrl = await uploadImageToFirebase();
                      AddCarsC.addCars(
                          AddCarsC.jenisC.dropDownValue!.value.toString(),
                          AddCarsC.jumlahpintuC.dropDownValue!.value.toString(),
                          AddCarsC.kecepatanC.text,
                          AddCarsC.acC.dropDownValue!.value.toString(),
                          AddCarsC.hargaC.text,
                          AddCarsC.namaC.text,
                          AddCarsC.wifiC.dropDownValue!.value.toString(),
                          AddCarsC.seatC.dropDownValue!.value.toString(),
                          AddCarsC.sensorC.dropDownValue!.value.toString(),
                          AddCarsC.bluetoothC.dropDownValue!.value.toString(),
                          imageUrl);
                    },
                    child: const Text("Add Cars"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// transmission

class Transmision extends StatefulWidget {
  const Transmision({
    super.key,
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

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
          widget.AddCarsC.jenisC.dropDownValue = selectedValue;
          final valueee = widget.AddCarsC.jenisC.dropDownValue!.value;
          print(valueee);
          // print(widget.AddCarsC.jenisC.dropDownValue!.value);
        });
      },
      controller: widget.AddCarsC.jenisC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        autofocus: false,
        controller: AddCarsC.namaC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        autofocus: false,
        controller: AddCarsC.kecepatanC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

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
          widget.AddCarsC.acC.dropDownValue = selectedValue;
        });
      },
      controller: widget.AddCarsC.acC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

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
          widget.AddCarsC.jumlahpintuC.dropDownValue = selectedValue;
          final valueee = widget.AddCarsC.jumlahpintuC.dropDownValue!.value;
          print(valueee);
          // print(widget.AddCarsC.jenisC.dropDownValue!.value);
        });
      },
      controller: widget.AddCarsC.jumlahpintuC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        autofocus: false,
        controller: AddCarsC.hargaC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

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
          widget.AddCarsC.wifiC.dropDownValue = selectedValue;
          final valueee = widget.AddCarsC.wifiC.dropDownValue!.value;
          print(valueee);
          // print(widget.AddCarsC.wifiC.dropDownValue!.value);
        });
      },
      controller: widget.AddCarsC.wifiC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

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
          widget.AddCarsC.seatC.dropDownValue = selectedValue;
          final valueee = widget.AddCarsC.seatC.dropDownValue!.value;
          print(valueee);
          // print(widget.AddCarsC.seatC.dropDownValue!.value);
        });
      },
      controller: widget.AddCarsC.seatC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

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
          widget.AddCarsC.sensorC.dropDownValue = selectedValue;
          final valueee = widget.AddCarsC.sensorC.dropDownValue!.value;
          print(valueee);
          // print(widget.AddCarsC.sensorC.dropDownValue!.value);
        });
      },
      controller: widget.AddCarsC.sensorC,
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
    required this.AddCarsC,
  });

  final AddCarsController AddCarsC;

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
          widget.AddCarsC.bluetoothC.dropDownValue = selectedValue;
          final valueee = widget.AddCarsC.bluetoothC.dropDownValue!.value;
          print(valueee);
          // print(widget.AddCarsC.bluetoothC.dropDownValue!.value);
        });
      },
      controller: widget.AddCarsC.bluetoothC,
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
