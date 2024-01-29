import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcar/models/car_model.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../../models/user_model.dart';

class TransaksiController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late SingleValueDropDownController metodePembayaranC;
  String? tanggalSewa;
  String? tanggalKembali;
  String? userID;
  String? carID;

  addTransaksi(
    String? metodePembayaran,
    String? tanggalSewa,
    String? tanggalKembali,
    String carID,
  ) {
    User? user = FirebaseAuth.instance.currentUser;
    UserModel loggedInUser = UserModel();
    // DocumentReference docCars = firestore.collection("users").doc();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) async {
      loggedInUser = UserModel.fromMap(value.data());
      String idUserLogin = loggedInUser.uid.toString();
      // DocumentReference docCars = firestore.collection("users").doc(idUserLogin);
      CollectionReference transaksi = firestore.collection("transaksi");
      try {
        await transaksi.add({
          "metodePembayaran": metodePembayaran,
          "tanggalSewa": tanggalSewa,
          "tanggalKembali": tanggalKembali,
          "userId": idUserLogin,
          "carID": carID
        });
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
    metodePembayaranC = SingleValueDropDownController();

    @override
    void onClose() {
      metodePembayaranC.dispose();
      super.onClose();
    }
  }
}
