import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcar/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentcar/pages/personal_detail.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/routes_name.dart';
import '../controllers/users/auth.dart';

class profile extends StatefulWidget {
  static const nameroute = '/profil';

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final authC = Get.find<AuthController>();
  File? _image;
  final picker = ImagePicker();

  String imagePath = "";
  String? imageUrl;

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            toolbarHeight: 200,
            centerTitle: true,
            title: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      getImage().then((value) => uploadImageToFirebase());
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: (_image == "")
                            ? Container(
                                child: Image(image: FileImage(_image!)),
                                height: 100,
                                width: 100,
                                color: Colors.black,
                              )
                            : Container(
                                child: Image(
                                    image: NetworkImage(
                                  "https://w7.pngwing.com/pngs/304/275/png-transparent-user-profile-computer-icons-profile-miscellaneous-logo-monochrome-thumbnail.png",
                                )),
                                height: 100,
                                width: 100,
                                color: Colors.black,
                              )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      ("${loggedInUser.firstName} ${loggedInUser.secondName}"
                          .toUpperCase()),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "${loggedInUser.email}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListTile(
              onTap: () {
                Get.toNamed(RouteName.personalDetail,
                    arguments: loggedInUser.uid);
              },
              leading: Image(image: AssetImage("images/person.png")),
              title: Text(
                "Personal Detail",
                style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.of(context).pushNamed(history.nameroute);
            //   },
            //   leading: Image(image: AssetImage('images/history.png')),
            //   title: Text(
            //     "Recent History",
            //     style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
            //   ),
            //   trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
            // ),
            ListTile(
              onTap: () {
                Get.toNamed(RouteName.Faq);
              },
              leading: Image(image: AssetImage("images/faq.png")),
              title: Text(
                "FAQ",
                style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(RouteName.aboutUs);
              },
              leading: Image(image: AssetImage('images/about.png')),
              title: Text(
                "About Us",
                style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
            ),

            ActionChip(
                label: Text("Logout"),
                onPressed: () {
                  authC.logout(context);
                  Get.toNamed(RouteName.loginScreen);
                }),
          ]))
        ],
      ),
    );
  }
}
