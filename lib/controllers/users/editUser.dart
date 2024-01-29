import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/routes_name.dart';
import 'package:rentcar/widgets/textfield.dart';

import '../../models/user_model.dart';

class editUserController extends GetxController {
  late TextEditingController firstnameC;
  late TextEditingController secondnameC;
  late TextEditingController emailC;
  late TextEditingController passwordC;
  late TextEditingController teleponC;
  late TextEditingController alamatC;
  late TextEditingController noKTPC;
  late TextEditingController noSIMC;
  late SingleValueDropDownController paymentC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = await firestore.collection("users").doc(docID);
    print(docRef.get());
    return docRef.get();
  }

  getLoginUser(
    String phoneNumber,
    String address,
    String noKTP,
    String noSIM,
  ) {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel loggedInUser = UserModel();
    // DocumentReference docCars = firestore.collection("users").doc();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      String idUserLogin = loggedInUser.uid.toString();
      DocumentReference docCars =
          firestore.collection("users").doc(idUserLogin);
      try {
        docCars.update({
          "telepon": phoneNumber,
          "alamat": address,
          "noKTP": noKTP,
          "noSIM": noSIM,
        });

        Get.defaultDialog(
          title: "Konfirmasi",
          middleText: "Apakah data yang diisi sudah benar?",
          onConfirm: () {
            Get.back();
            teleponC.clear();
            alamatC.clear();
            noKTPC.clear();
            noSIMC.clear();

            Get.toNamed(RouteName.navigasi);
          },
          textConfirm: "Sudah",
          textCancel: "Belum",
          onCancel: () {},
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Gagal Mengubah Data",
        );
      }
    });
  }

  updateUser(
    String firstname,
    String secondname,
  ) {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel loggedInUser = UserModel();
    // DocumentReference docCars = firestore.collection("users").doc();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      String idUserLogin = loggedInUser.uid.toString();
      DocumentReference docCars =
          firestore.collection("users").doc(idUserLogin);
      try {
        docCars.update({
          "firstName": firstname,
          "secondName": secondname,
        });

        Get.defaultDialog(
          title: "Konfirmasi",
          middleText: "Apakah data yang diisi sudah benar?",
          onConfirm: () {
            Get.back();
            teleponC.clear();
            alamatC.clear();
            noKTPC.clear();
            noSIMC.clear();

            Get.toNamed(RouteName.profile);
          },
          textConfirm: "Sudah",
          textCancel: "Belum",
          onCancel: () {},
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Gagal Mengubah Data",
        );
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    firstnameC = TextEditingController();
    secondnameC = TextEditingController();
    passwordC = TextEditingController();
    emailC = TextEditingController();
    teleponC = TextEditingController();
    alamatC = TextEditingController();
    noSIMC = TextEditingController();
    noKTPC = TextEditingController();
    paymentC = SingleValueDropDownController();
  }

  @override
  void onClose() {
    firstnameC.dispose();
    secondnameC.dispose();
    passwordC.dispose();
    emailC.dispose();
    teleponC.dispose();
    alamatC.dispose();
    noSIMC.dispose();
    noKTPC.dispose();
    paymentC.dispose();
    super.onClose();
  }
}
