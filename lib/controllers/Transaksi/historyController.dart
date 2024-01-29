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

class HistoryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late SingleValueDropDownController metodePembayaranC;
  String? tanggalSewa;
  String? tanggalKembali;
  String? userID;
  String? carID;

   Future<DocumentSnapshot<Object?>> getData(String docId) async {
    DocumentReference docRef = firestore.collection("cars").doc(docId);
    return docRef.get();
  }

  Stream<QuerySnapshot<Object?>> streamdataCars() {
    CollectionReference Cars = firestore.collection("cars");
    return Cars.snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamdataUser() {
    CollectionReference users = firestore.collection("users");
    return users.snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamdataTransaksi() {
    CollectionReference transaksi = firestore.collection("transaksi");
    return transaksi.snapshots();
  }
}
